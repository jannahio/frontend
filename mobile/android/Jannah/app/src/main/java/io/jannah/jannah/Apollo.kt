package io.jannah.jannah

import com.apollographql.apollo3.ApolloClient
val apolloClient = ApolloClient.Builder()
    .serverUrl("http://dev.jannah.io:8000/graphql")
    .build()