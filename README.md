

# Final solo  - Mod 3 



## About this Application

This is a full-stack Tea Subscription Service application built with Rails API (backend) and React (frontend). The application allows admins to manage tea subscriptions, view details about teas and subscribers, and cancel subscriptions.

## Setup

1. Fork and clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{drop,create,migrate,seed}`

Spend some time familiarizing yourself with the functionality and structure of the application so far.

Run the application and test out some endpoints: `rails s`

## Endpoints
BASE URL: `http://localhost:3000`

### Get Subsciptions 

REQUEST

``` GET /api/v1/subscriptions ```

RESPONSE

```
{
  "data": [
    {
      "id": "21",
      "type": "subscription",
      "attributes": {
        "title": "Chinese Knot-Weed Subscription",
        "price": "11.85",
        "frequency": "monthly"
      },
      "relationships": {
        "teas": { "data": [ { "id": "10" }, { "id": "9" }, { "id": "8" } ] },
        "customers": { "data": [ { "id": "15" }, { "id": "19" }, { "id": "20" } ] }
      }
    },
    {
      "id": "22",
      "type": "subscription",
      "attributes": {
        "title": "Dianhong Subscription",
        "price": "5.96",
        "frequency": "monthly"
      },
      "relationships": {
        "teas": { "data": [ { "id": "9" } ] },
        "customers": { "data": [ { "id": "18" } ] }
      }
    },
    {
      "id": "25",
      "type": "subscription",
      "attributes": {
        "title": "Yi Zhen Bai Hao Subscription",
        "price": "7.35",
        "frequency": "monthly"
      },
      "relationships": {
        "teas": { "data": [ { "id": "8" } ] },
        "customers": { "data": [] }
      }
    },
    {
      "id": "35",
      "type": "subscription",
      "attributes": {
        "title": "Lishan Subscription",
        "price": "5.88",
        "frequency": "monthly"
      },
      "relationships": {
        "teas": { "data": [ { "id": "7" }, { "id": "6" } ] },
        "customers": { "data": [ { "id": "12" }, { "id": "13" }, { "id": "11" } ] }
      }
    }
  ]
}

```

### Specific Subcription Search

REQUEST

```GET /api/v1/subscriptions/27```

RESPONSE

```
{
    "data": {
        "id": "27",
        "type": "subscription",
        "attributes": {
            "title": "Gaoshan Subscription",
            "price": "12.82",
            "frequency": "bi-weekly"
        },
        "relationships": {
            "teas": {
                "data": [
                    {
                        "id": "8",
                        "type": "tea"
                    },
                    {
                        "id": "10",
                        "type": "tea"
                    },
                    {
                        "id": "7",
                        "type": "tea"
                    }
                ]
            },
            "customers": {
                "data": [
                    {
                        "id": "14",
                        "type": "customer"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "8",
            "type": "tea",
            "attributes": {
                "title": "Dongfang Meiren",
                "description": "Laborum doloremque vero eveniet.",
                "temperature": 203,
                "brew_time": 2
            }
        },
        {
            "id": "10",
            "type": "tea",
            "attributes": {
                "title": "Scottish Breakfast",
                "description": "Quam ipsam fugit culpa.",
                "temperature": 175,
                "brew_time": 5
            }
        },
        {
            "id": "7",
            "type": "tea",
            "attributes": {
                "title": "Dill",
                "description": "Sapiente eos aut sint.",
                "temperature": 204,
                "brew_time": 5
            }
        },
        {
            "id": "14",
            "type": "customer",
            "attributes": {
                "first_name": "Scotty",
                "last_name": "Batz",
                "email": "jacki@satterfield.test",
                "address": "10537 Alyse Hollow, Robhaven, MT 82165-1823",
                "customer_subscription_id": 26
            }
        }
    ]
}
```

### Cancel a subscription for a specific customer

REQUEST

``` PATCH /api/v1/customer_subscriptions/11/23```
11 = customer ID /
23 = subscription ID






RESPONSE

```
{
    "message": "Cancelation Sucessful"
}
```