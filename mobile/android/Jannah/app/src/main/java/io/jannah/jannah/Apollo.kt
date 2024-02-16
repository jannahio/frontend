package io.jannah.jannah
//.serverUrl("http://dev.jannah.io:8080/graphql")
import com.apollographql.apollo3.ApolloClient
val apolloClient = ApolloClient.Builder()
    .serverUrl("http://uxjannahio.local/graphql")
    .build()