package io.jannah.jannah

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
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp

@Composable
fun LaunchList(onLaunchClick: (launchId: String) -> Unit) {
    LazyColumn {
        items(5) {
            LaunchItem(launchId = it.toString(), onClick = onLaunchClick)
        }
    }
}

@Composable
private fun LaunchItem(launchId: String, onClick: (launchId: String) -> Unit) {
    ListItem(
        modifier = Modifier.clickable { onClick(launchId) },
        headlineContent = {
            // Mission name
            Text(text = "Launch $launchId")
        },
        supportingContent = {
            // Site
            Text(text = "Site...")
        },
        leadingContent = {
            // Mission patch
            Image(
                modifier = Modifier.size(68.dp, 68.dp),
                painter = painterResource(R.drawable.ic_launcher_background),
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
