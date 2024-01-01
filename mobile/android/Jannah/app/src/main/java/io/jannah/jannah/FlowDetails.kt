package io.jannah.jannah

import android.util.Log
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.LocalContentColor
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import androidx.compose.foundation.Image
import com.apollographql.apollo3.api.Error
import com.apollographql.apollo3.exception.ApolloException
import  com.apollographql.apollo3.api.ApolloResponse
import io.jannah.jannah.WorkflowDetailsState.ApplicationError
import io.jannah.jannah.WorkflowDetailsState.Loading
import io.jannah.jannah.WorkflowDetailsState.ProtocolError
import io.jannah.jannah.WorkflowDetailsState.Success
import kotlinx.coroutines.launch


private sealed interface WorkflowDetailsState {
    object Loading : WorkflowDetailsState
    data class ProtocolError(val exception: ApolloException) : WorkflowDetailsState
    data class ApplicationError(val errors: List<Error>) : WorkflowDetailsState
    data class Success(val data: WorkflowDetailsQuery.Data) : WorkflowDetailsState
}
@Composable
fun FlowDetails(flowId: String) {
        var state by remember { mutableStateOf <WorkflowDetailsState> ( Loading ) }
        LaunchedEffect(Unit) {
            state = try {
                val response = apolloClient.query(WorkflowDetailsQuery(flowId)).execute()
                if (response.hasErrors()) {
                    ApplicationError(response.errors!!)
                } else {
                    Success(response.data!!)
                }
            } catch (e: ApolloException) {
                ProtocolError(e)
            }
        }
        when (val s = state) {
            Loading -> Loading()
            is ProtocolError -> ErrorMessage("Oh no... A protocol error happened: ${s.exception.message}")
            is ApplicationError -> ErrorMessage(s.errors[0].message)
            is Success -> FlowDetails(s.data)
        }
    }
@Composable
fun FlowDetails(response: WorkflowDetailsQuery.Data) {
    Column(
        modifier = Modifier.padding(16.dp)
    ) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            // Flow patch
            Image(
                modifier = Modifier.size(160.dp, 160.dp),
                painter = painterResource(R.drawable.ic_launcher_background),
                contentDescription = "Flow patch"
            )
//            AsyncImage(
//                modifier = Modifier.size(160.dp, 160.dp),
////                model = painterResource(R.drawable.ic_launcher_background),
//                painter = painterResource(R.drawable.ic_launcher_background),
//                placeholder = painterResource(R.drawable.ic_launcher_background),
//                error = painterResource(R.drawable.ic_launcher_background),
//                contentDescription = "Flow patch"
//            )

            Spacer(modifier = Modifier.size(16.dp))

            Column {
                // Flow name
                Text(
                    style = MaterialTheme.typography.headlineMedium,
                    text = response.workflow?.name ?: ""
                )

                // Flow Description
                Text(
                    modifier = Modifier.padding(top = 8.dp),
                    style = MaterialTheme.typography.headlineSmall,
                    text = response.workflow?.description ?: "",
                )

                // isStarted
                if (response.workflow?.isStarted == true) {
                    Text(
                        modifier = Modifier.padding(top = 8.dp),
                        style = MaterialTheme.typography.titleMedium,
                        text = "Started"
                    )
                }
                else{
                    Text(
                        modifier = Modifier.padding(top = 8.dp),
                        style = MaterialTheme.typography.titleMedium,
                        text = "Not started"
                    )
                }

            }
        }

        // Start button
        Button(
            modifier = Modifier
                .padding(top = 32.dp)
                .fillMaxWidth(),
            onClick = { /*TODO*/ }
        ) {
            Text(text = "Start now")
        }
    }
}

@Composable
private fun ErrorMessage(text: String) {
    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
        Text(text = text)
    }
}

@Composable
private fun Loading() {
    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
        CircularProgressIndicator()
    }
}

@Composable
private fun SmallLoading() {
    CircularProgressIndicator(
        modifier = Modifier.size(24.dp),
        color = LocalContentColor.current,
        strokeWidth = 2.dp,
    )
}

@Preview(showBackground = true)
@Composable
private fun FlowDetailsPreview() {
   FlowDetails(flowId = "1")
}
