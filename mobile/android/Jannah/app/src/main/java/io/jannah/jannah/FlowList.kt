package io.jannah.jannah

import android.util.Log
import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.CircularProgressIndicator
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

@Composable
fun FlowList(onWorkflowClick: (flowId: String) -> Unit) {
    var workflowList by remember { mutableStateOf(emptyList<WorkflowListQuery.Workflow>()) }
    LaunchedEffect(Unit) {
        Log.d("FlowList", "pre WorkflowListQuery")
        val response = apolloClient.query(WorkflowListQuery()).execute()
        Log.d("FlowList", "Success ${response.data}")
        workflowList = response.data?.workflows?.workflows?.filterNotNull() ?: emptyList()
    }
    LazyColumn {
            items(
                workflowList.count(),
                contentType = { mutableStateOf(emptyList<WorkflowListQuery.Workflow>()) }
            ) { index ->
                val workflow = workflowList[index]
                FlowItem(workflow = workflow, onClick = onWorkflowClick)
            }
    }
}

@Composable
//private fun FlowItem(flowId: String, onClick: (flowId: String) -> Unit) {
private fun FlowItem(workflow: WorkflowListQuery.Workflow, onClick: (flowId: String) -> Unit) {
    ListItem(
        modifier = Modifier.clickable { onClick(workflow.id) },
        headlineContent = {
            // Flow name
            Text(text = "Flow ${workflow.id}")
        },
        supportingContent = {
            // Description
            Text(text = "Flow descriptions...")
        },
        leadingContent = {
            // Flow patch
            Image(
                modifier = Modifier.size(68.dp, 68.dp),
                painter = painterResource(R.drawable.ic_launcher_background),
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
