@file:OptIn(ExperimentalMaterial3Api::class)

package io.jannah.jannah

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ListItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import android.util.Log
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.foundation.lazy.items
//@Composable
//fun FlowList(onFlowClick: (flowId: String) -> Unit) {
//    LaunchedEffect(Unit) {
//        val response = apolloClient.query(WorkflowListQuery()).execute()
//        Log.d("FlowList", "Success ${response.data}")
//    }
//}

@Composable
fun FlowList(onFlowClick: (flowId: String) -> Unit) {
    var flowList by remember { mutableStateOf(emptyList<WorkflowListQuery.Workflow>())}
    LaunchedEffect(Unit) {
            val response = apolloClient.query(WorkflowListQuery()).execute()
            flowList = response.data?.workflows?.workflows?.filterNotNull() ?: emptyList()
    }

    LazyColumn {
        items(flowList) { flow ->
            FlowItem(flow = flow, onClick = onFlowClick)
        }
    }
}


@Composable
private fun FlowItem(flow: WorkflowListQuery.Workflow, onClick: (flowId: String) -> Unit) {
    ListItem(
        modifier = Modifier.clickable { onClick(flow.id) },
        headlineText = {
            // Flow name
                Text(text = "Flow ${flow.id}")
        },
        supportingText = {
            // Site
            Text(text = "Site...")
        },
        leadingContent = {
            // Mission patch
            Image(
                modifier = Modifier.size(68.dp, 68.dp),
                painter = painterResource(R.drawable.jannah_logo_background),
                contentDescription = "Flow patch"
            )
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
