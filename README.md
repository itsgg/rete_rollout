# Introduction

A simple application that triggers user features, based on rete rules.

## Endpoints

### Queries

```graphql
query features($userId: ID!) {
  features(userId: $userId)
}
```

```json
{
    "userId": 1
}
```

### Mutations

```graphql
mutation strike($userId: ID!) {
    strike(userId: $userId)
}
```

```json
{
    "userId": 1
}
```
