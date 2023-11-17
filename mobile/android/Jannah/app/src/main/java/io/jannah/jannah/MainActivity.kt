@file:OptIn(ExperimentalMaterial3Api::class)

package io.jannah.jannah

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
//import androidx.compose.foundation.layout.fillMaxSize
//import androidx.compose.material3.MaterialTheme
//import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview


import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.TopAppBar
import androidx.compose.ui.res.stringResource
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

import io.jannah.jannah.ui.theme.JannahTheme


import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        TokenRepository.init(this)
        setContent {
            JannahTheme {
                // A surface container using the 'background' color from the theme
//                Surface(
//                    modifier = Modifier.fillMaxSize(),
//                    color = MaterialTheme.colorScheme.background
//                ) {
//                    Greeting("Jannah")
//                }

                Scaffold(topBar = { TopAppBar({ Text(stringResource(R.string.app_name)) }) }) { paddingValues ->
                    Box(Modifier.padding(paddingValues)) {
                        FlowNavHost()
//                        MainNavHost()

                    }
                }
            }
        }
    }
}

// Implementation baseed on inspiration from
// https://developer.android.com/guide/navigation/use-graph/navigate
// Top most navigation for the various Flows within Jannah
@Composable
private fun FlowNavHost() {
    val navController = rememberNavController()
    NavHost(navController, startDestination = NavigationDestinations.FLOW_LIST) {
        composable(route = NavigationDestinations.FLOW_LIST) {
            FlowList(
                onFlowClick = { flowId ->
                    navController.navigate("${NavigationDestinations.FLOW_DETAILS}/$flowId")
                }
            )
        }

        composable(route = "${NavigationDestinations.FLOW_DETAILS}/{${NavigationArguments.FLOW_ID}}") { navBackStackEntry ->
            FlowDetails(flowId = navBackStackEntry.arguments!!.getString(NavigationArguments.FLOW_ID)!!)
        }

        composable(route = NavigationDestinations.LOGIN) {
            Login()
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    JannahTheme {
        Greeting("Android")
    }
}