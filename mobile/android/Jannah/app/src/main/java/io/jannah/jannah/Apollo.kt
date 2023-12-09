package io.jannah.jannah
//.serverUrl("http://dev.jannah.io:8080/graphql")
import com.apollographql.apollo3.ApolloClient
val apolloClient = ApolloClient.Builder()
    .serverUrl("http://devjannahio.local:8200/graphql")
    .build()