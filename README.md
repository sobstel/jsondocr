jsondocr
========

DSL for documenting JSON schema.

[![Gem Version](https://badge.fury.io/rb/jsondocr.png)](http://badge.fury.io/rb/jsondocr)
[![Code Climate](https://codeclimate.com/github/sobstel/jsondocr.png)](https://codeclimate.com/github/sobstel/jsondocr)

Element types
-------------

* doc
* object (document)
* property (field)
* array

Usage
-----

```ruby
schema = JSONdocr::Builders::Doc.new

schema.doc do
  name "Example"
  desc "general desc"

  object :sample do
    term "Sample object (document)"
    desc "document is an alias for object"

    field :id do
      term "Unique identifier"
      type :int
    end

    field :type do
      term "Samle type"
      type :string
      validates inclusion: { in: %w{real fake other}, message: "Wrong type" }
    end

    array :list_of_documents do
      term "List of documents"
      item object do
        field :content do
          term "Document content"
          type :string
        end
      end
    end

    object :author do
      term "Object author"

      field :first_name do
        term "Author first name"
        type :string
      end

      field :last_name do
        term "Author last name"
        type :string
      end
    end
  end
end
```

Example
-------

Football schema (golazon) for mongodb

* definitions: (https://github.com/sobstel/mago/tree/master/lib "football schema")
* auto-generated html: http://schema.golazon.com/
