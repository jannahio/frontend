@file:OptIn(ExperimentalMaterial3Api::class)

package io.jannah.jannah

import androidx.compose.material3.ExperimentalMaterial3Api

object NavigationDestinations {
    const val FLOW_LIST = "flowList"
    const val FLOW_DETAILS = "flowDetails"
    const val LOGIN = "login"
}

object NavigationArguments {
    const val FLOW_ID = "flowId"
}
