package io.jannah.jannah

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ListItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.api.Optional
import android.util.Log
import androidx.compose.foundation.Image

@Composable
fun FlowList(onFlowClick: (flowId: String) -> Unit) {
    var cursor: String? by remember { mutableStateOf(null) }
    var response: ApolloResponse<WorkflowListQuery.Data>? by remember { mutableStateOf(null) }
    var workflowList by remember { mutableStateOf(emptyList<WorkflowListQuery.Workflow>()) }
    LaunchedEffect(cursor) {
        Log.d("FlowList", "pre WorkflowListQuery")
        response = apolloClient.query(WorkflowListQuery(Optional.present(cursor))).execute()
        Log.d("FlowList", "Success ${response?.data}")
        workflowList = workflowList + response?.data?.workflows?.workflows?.filterNotNull().orEmpty()
    }

    LazyColumn {
        items(workflowList.count()){ index ->
            val workflow = workflowList[index]
            FlowItem(workflow = workflow, onClick = onFlowClick)
        }
        item {
            if (response?.data?.workflows?.hasMore == true) {
                LoadingItem()
                cursor = response?.data?.workflows?.cursor
            }
        }
    }

}


@Composable
private fun FlowItem(workflow: WorkflowListQuery.Workflow, onClick: (flowId: String) -> Unit) {
    ListItem(
        modifier = Modifier.clickable { onClick(workflow.id) },
        headlineContent = {
            // Flow name
            Text(text = workflow.name)
        },
        supportingContent = {
            // Description
            Text(text = workflow.description)
        },
        leadingContent = {
            // Flow patch
            Image(
                modifier = Modifier.size(160.dp, 160.dp),
                painter = painterResource(R.drawable.ic_launcher_background),
                contentDescription = "Flow patch"
            )
//            AsyncImage(
//                modifier = Modifier.size(68.dp, 68.dp),
//                model = painterResource(R.drawable.ic_launcher_background),
//                placeholder = painterResource(R.drawable.ic_launcher_background),
//                error = painterResource(R.drawable.ic_launcher_background),
//                contentDescription = "Flow patch"
//            )
        }
    )
}

@Composable
private fun LoadingItem() {
    Box(
        contentAlignment = Alignment.Center,
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp)
    ) {
        CircularProgressIndicator()
    }
}
