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

## Rollout

### Features

```ruby
Rollout.instance.set_feature_data :joza, description: 'Has one strike'
```

Features are also activated when they are first referrred.

### User

```ruby
Rollout.instance.activate_user(:joza, User.last)
Rollout.instance.active?(:joza, User.last)
Rollout.instance.feature_states(User.first).select { |_, active| active }.keys
Rollout.instance.deactivate_user(:joza, User.last)
```

### Group

```ruby
Rollout.instance.activate_group(:chat, :all)
Rollout.instance.define_group(:odd_users) { |user| user.id.odd? }
Rollout.instance.activate_group(:joza, :add_users
Rollout.instance.deactivate_group(:joza, :add_users)
```

### Global

```ruby
Rollout.instance.activate(:joza)
Rollout.instance.deactivate(:joza)
Rollout.instance.clear!
```

### Percentage

```ruby
Rollout.instance.activate_percentage(:joza, 20) # Can be randomized
Rollout.instance.deactivate_percentage(:joza)
```

## Rete

### Defining rule

```ruby
Rete.instance.rule 'level-up' do
  forall do
    has :User, :strike, :Strike
  end

  make do
    action do |token|
      user = token[:User]
      level = Rollout.instance.features[user.strikes.count - 1]
      return if level.blank?

      Rollout.instance.activate_user level, user
    end
  end
end
```

XXX: Use ruleset to improve performance.

### Adding a fact

```ruby
Rete.instance << [User.last, :strike, Strike.last]
```

### Matchers

- has: Passes when a fact matches the template.
- neg: Passes when a fact cannot match the template.
- maybe: Passes whether or not a fact matches the template. Useless, expect for variable creation.
- none: Passes when entire subchain yields an empty resultset.
- any: Passes if any of the subchains return a non-empty set.
- assign: Assigns a value to variable and passes.
- assuming: Allows you to reuse common prefixs.
- same: Passes if arguments are equal.
- diff: Passes if arguments are not equal.
- less: Passes if x < y.
- greater: Passes if y > x.
- assert: Passes if the block returns a truthy value.

### Actions

- gen: Assets a fact and links to its current token.
- action: Code executed on production node activation.
- collect: Returns unique values of all variable values.
- error: Will return all generated errors.
- trace: Prints a message when the production node is actiavted.
