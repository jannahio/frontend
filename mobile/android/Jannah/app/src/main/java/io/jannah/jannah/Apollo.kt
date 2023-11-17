package io.jannah.jannah

import com.apollographql.apollo3.ApolloClient
val apolloClient = ApolloClient.Builder()
    .serverUrl("http://devjannahio.local:8080/graphql")
    .build()