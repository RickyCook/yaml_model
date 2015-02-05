[![Build Status](https://travis-ci.org/RickyCook/yaml_model.svg)](https://travis-ci.org/RickyCook/yaml_model)[![Coverage Status](https://coveralls.io/repos/RickyCook/yaml_model/badge.svg?branch=master)](https://coveralls.io/r/RickyCook/yaml_model?branch=master)[![Join the chat at https://gitter.im/RickyCook/yaml_model](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/RickyCook/yaml_model?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# YAML Model
Semi-transparent YAML serialization/deserialization. What does this mean? Well,
much like every other serialization method ever, you create your "fields" that
are to be serialized, give the serializer data, then hit the go button. The
difference here is that this mostly happens under the covers of a regular
Python object.

## Examples
```python
from datetime import datetime
from yaml_model import LoadOnAccess, Model

class User(Model):
    """ A basic user model """
    email = LoadOnAccess(default='')
    created_ts = LoadOnAccess(generate=lambda _: datetime.now())

    def __init__(self, slug):
        self.slug = slug
        super(User, self).__init__()

# Save a new user
new_user = User('my_username')
new_user.email = 'hey@there.com'
new_user.save()

# This will save a file './data/users/my_username.yaml' with content:
# email: hey@there.com
# created_ts: 2015-02-01 15:41:23.99072

# Load up that same user
load_user = User('my_username')

print(load_user.email)
# Will print hey@there.com

print(type(load_user.create_ts))
# Will print datetime.datetime

print(load_user.created_ts)
# Will print datetime.datetime(2015, 2, 1, 15, 41, 23, 99072)
```

## Generators and defaults
For the `LoadOnAccess` field type, there are 2 `kwargs` that you can specify
for "default" values. The difference between them is relatively minor. Namely,
the `generate` kwarg takes precidence over the `default` kwarg, and the
`generate` kwarg output is persisted to the model file, whereas the `default`
value is not. Other than that, they behave the same.

Both values may be either a static value, or a callable. Callables will be
called, and passed the model it's being called on as the first argument.

### ModelReference differences
When adding a ModelReference field, these fields are considered to return
a cat slug, or an instance of a Model.
