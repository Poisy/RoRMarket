# RoR Market

Simple Ruby on Rails API for managing products with cards.

## Setup with docker

1. Run docker-compose:

    ```sh
    docker-compose build
    ```

    ```sh
    docker-compose up
    ```

2. Setup database:

    ```sh
    docker-compose exec web bundle exec rails db:setup
    ```

## Endpoints

- [GET] /brands
- [GET] /brands/:id
- [GET] /products
- [GET] /products/:id
- [GET] /cards/:id
- [POST] /issue
