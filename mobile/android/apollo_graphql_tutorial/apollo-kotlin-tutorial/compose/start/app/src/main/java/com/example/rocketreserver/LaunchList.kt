@file:OptIn(ExperimentalMaterial3Api::class)

package com.example.rocketreserver

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
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
import android.util.Log
import com.apollographql.apollo3.api.ApolloResponse
import com.apollographql.apollo3.api.Optional


//@Composable
//fun LaunchList(onLaunchClick: (launchId: String) -> Unit) {
//    var cursor: String? by remember { mutableStateOf(null) }
//    var response: ApolloResponse<LaunchListQuery.Data>? by remember { mutableStateOf(null) }
//    var launchList by remember { mutableStateOf(emptyList<LaunchListQuery.Launch>()) }
//    LaunchedEffect(cursor) {
//        response = apolloClient.query(LaunchListQuery(Optional.present(cursor))).execute()
//        launchList = launchList + response?.data?.launches?.launches?.filterNotNull().orEmpty()
//
//        val response = apolloClient.query(LaunchListQuery()).execute()
//        Log.d("LaunchList", "Success ${response.data}")
//        launchList = response.data?.launches?.launches?.filterNotNull() ?: emptyList()
//    }
//
//    LazyColumn {
//        items(
//            launchList.count(),
//            contentType =  { mutableStateOf(emptyList<LaunchListQuery.Launch>()) }
//        )
//        { index ->
//            val launch = launchList[index]
//            LaunchItem(launch = launch, onClick = onLaunchClick)
//        }
//    }
//}

@Composable
fun LaunchList(onLaunchClick: (launchId: String) -> Unit) {
    var cursor: String? by remember { mutableStateOf(null) }
    var response: ApolloResponse<LaunchListQuery.Data>? by remember { mutableStateOf(null) }
    var launchList by remember { mutableStateOf(emptyList<LaunchListQuery.Launch>()) }
    LaunchedEffect(cursor) {
        response = apolloClient.query(LaunchListQuery(Optional.present(cursor))).execute()
        Log.d("LaunchList", "Success ${response?.data}")
        launchList = launchList + response?.data?.launches?.launches?.filterNotNull().orEmpty()
    }

    LazyColumn {
        items(launchList.count()) { index ->
            val launch = launchList[index]
            LaunchItem(launch = launch, onClick = onLaunchClick)
        }
        item {
            if (response?.data?.launches?.hasMore == true) {
                LoadingItem()
                cursor = response?.data?.launches?.cursor
            }
        }
    }
}

@Composable
//private fun LaunchItem(launchId: String, onClick: (launchId: String) -> Unit) {
private fun LaunchItem(launch: LaunchListQuery.Launch, onClick: (launchId: String) -> Unit) {
    ListItem(
        modifier = Modifier.clickable { onClick(launch.id) },
        headlineText = {
            // Mission name
//            Text(text = "Launch ${launch.id}")
            Text(text = launch.mission?.name ?: "")
        },
        supportingText = {
            // Site
            Text(text = "Site...")
        },
        leadingContent = {
            // Mission patch

//            Image(
//                    modifier = Modifier.size(68.dp, 68.dp),
//                painter = painterResource(R.drawable.ic_placeholder),
//                contentDescription = "Mission patch"
//            )
            AsyncImage(
                modifier = Modifier.size(68.dp, 68.dp),
                model = launch.mission?.missionPatch,
                placeholder = painterResource(R.drawable.ic_placeholder),
                error = painterResource(R.drawable.ic_placeholder),
                contentDescription = "Mission patch"
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
