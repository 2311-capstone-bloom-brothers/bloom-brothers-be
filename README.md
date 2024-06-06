# Bloom Brothers Backend API

## Table of Contents 
  1.  [About This API](#about-this-api)
  2.  [Set Up](#set-up)
  2.  [End Points](#end-points)
  3.  [Plant Generator Micro-service](#plant-generator-micro-service)
  5.  [Front End Repo](#front-end-repo)
  4.  [Contributors](#contributors)

### About This API
  <details>
    <summary> Description </summary>
     The Bloom Brothers API serves as the backbone for the Bloom Baby Plant Simulator Application, managing comprehensive interactions with the application's plant database. Designed with a service-oriented architecture (SOA), the API incorporates a custom plant generator microservice, ensuring dynamic and fun plant simulations.
  </details>

  <details>
    <summary> Key Features</summary>
      
      * CRUD Operations: Efficiently handles GET, POST, and DELETE HTTP requests, providing seamless data management with JSON-formatted responses powered by the json-api gem for serialization.
    
      * Robust Testing: Comprehensive sad path and edge case testing ensure reliability, achieving an impressive 97% test coverage. Continuous integration is facilitated via CircleCI.

      * Cross-Origin Resource Sharing (CORS): Supports CORS middleware, enabling smooth integration with the frontend application built using JavaScript and React.

      * Database Management: Utilizes PostgreSQL for robust and scalable data storage, maintaining all plant-related data including attributes, growth stages, and breeding mechanisms.

      * Breeding Mechanism: Allows plants to breed, creating diverse and unique plant types within the simulation.

      * User Authentication: Implements light user authentication using Rails' built-in .authenticate method to secure certain endpoints and actions.
  </details>
  
### Set Up
  run `bundle install` </br>
  run `rails s` to start server locally

  ruby version `3.2.2`</br>
  rails version `7.1.3.2`

### End Points
  All End Points will have a prefix of `"/api/v0"` ex: `get "/api/v0/plants"`. 

  <details>
    <summary> GET all plants </summary>
    ENDPOINT <code>"/plants"</code> This gets all plants from the database.</br>
      Response: 
        <pre><code> {
        "data": [
          {
            "id": "1",
            "type": "plant",
            "attributes": {
              "name": "Rose",
              "description": "The flower of love",
              "plant_type": "flower1",
              "planted": 1716929177,
              "lifespan": 86400000,
              "position": null,
              "phases": {
                "stem": {
                  "path": [
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.56],
                      [0.1, 4.5, 0.88],
                      [0.1, 7.46, 1.42],
                      [0.1, 8.34, 1.08],
                      [0.1, 8.42, 0],
                      [0.1, 7.08, -0.26]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.56],
                      [0.1, 2.5, 0.88],
                      [0.1, 5.46, 1.42],
                      [0.1, 6.34, 1.08],
                      [0.1, 6.42, 0],
                      [0.1, 5.08, -0.26]
                    ]
                  ],
                  "color": [
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0]
                  ],
                  "stemWidth": [0.4, 0.4, 0.4, 0.4, 0.4]
                },
                "bloom": {
                  "color": [
                    [231, 172, 190],
                    [231, 172, 190],
                    [231, 172, 190],
                    [231, 172, 190],
                    [231, 172, 190]
                  ],
                  "height": [0.16, 0.14, 0.04, 0.04, 0.03],
                  "rotation": [
                    [0, 0, 0],
                    [0.03, 0, 0],
                    [-0.38, 0.07, -0.43],
                    [-0.38, 0.07, 0.07],
                    [-0.71, 0.07, -0.43]
                  ],
                  "radiusTop": [0.3, 0.44, 0.65, 1.09, 0.87],
                  "recRadius": [0.16, 0.16, 0.18, 0.2, 0.14],
                  "noiseScale": [0.46, 1.58, 1.69, 1.26, 0.19],
                  "petalCount": [1, 1, 1, 1, 1],
                  "noiseImpactX": [0.46, 0.47, 0.5, 0.5, 0.48],
                  "noiseImpactY": [0.34, 0.5, 0.93, 2.23, 2.63],
                  "noiseImpactZ": [0, 0, 1, 0.97, 0.94],
                  "radiusBottom": [0.3, 0.4, 0.98, 1.09, 0.46],
                  "radialSegments": [100, 100, 100, 29.35, 11.88]
                }
              }
            }
          },
          {
            "id": "2",
            "type": "plant",
            "attributes": {
              "name": "Sun Flower",
              "description": "Bows down to no man or Star",
              "plant_type": "flower1",
              "planted": 1716929177,
              "lifespan": 86400000,
              "position": null,
              "phases": {
                "stem": {
                  "path": [
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.56],
                      [0.1, 4.5, 0.88],
                      [0.1, 7.46, 1.42],
                      [0.1, 8.34, 1.08],
                      [0.1, 8.42, 0],
                      [0.1, 7.08, -0.26]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.56],
                      [0.1, 2.5, 0.88],
                      [0.1, 5.46, 1.42],
                      [0.1, 6.34, 1.08],
                      [0.1, 6.42, 0],
                      [0.1, 5.08, -0.26]
                    ]
                  ],
                  "color": [
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0]
                  ],
                  "stemWidth": [0.4, 0.4, 0.4, 0.4, 0.4]
                },
                "bloom": {
                  "color": [
                    [128, 80, 68],
                    [128, 80, 68],
                    [128, 80, 68],
                    [128, 80, 68],
                    [128, 80, 68]
                  ],
                  "height": [0.16, 0.09, 0.04, 0.04, 0.02],
                  "rotation": [
                    [0, 0, 0],
                    [0.03, 0, 0],
                    [-0.38, 0.07, -0.43],
                    [-0.38, 0.07, 0.07],
                    [-0.71, 0.07, -0.43]
                  ],
                  "radiusTop": [0.3, 0.37, 0.96, 1.09, 0.81],
                  "recRadius": [0.16, 0.17, 0.18, 0.2, 0.17],
                  "noiseScale": [0.46, 1.77, 1.76, 1.18, 0.28],
                  "petalCount": [1, 1, 1, 1, 1],
                  "noiseImpactX": [0.46, 0.47, 0.5, 0.5, 0.48],
                  "noiseImpactY": [0.34, 0.4, 0.82, 2.15, 2.63],
                  "noiseImpactZ": [0, 0, 0, 0.97, 0.94],
                  "radiusBottom": [0.3, 0.43, 0.94, 1.09, 0.75],
                  "radialSegments": [100, 100, 100, 26.57, 11.88]
                }
              }
            }
          },
          {
            "id": "3",
            "type": "plant",
            "attributes": {
              "name": "rose",
              "description": "blue",
              "plant_type": "flower1",
              "planted": 1716929258,
              "lifespan": 86400000,
              "position": null,
              "phases": {
                "stem": {
                  "path": [
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0],
                      [0.1, 0.7, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0],
                      [0.1, 1.76, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.8],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0],
                      [0.1, 7, 0]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.56],
                      [0.1, 4.5, 0.88],
                      [0.1, 7.46, 1.42],
                      [0.1, 8.34, 1.08],
                      [0.1, 8.42, 0],
                      [0.1, 7.08, -0.26]
                    ],
                    [
                      [0.5, 0, 0],
                      [0.5, 0, 0],
                      [0.5, 0, 0.56],
                      [0.1, 2.5, 0.88],
                      [0.1, 5.46, 1.42],
                      [0.1, 6.34, 1.08],
                      [0.1, 6.42, 0],
                      [0.1, 5.08, -0.26]
                    ]
                  ],
                  "color": [
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0],
                    [0, 255, 0]
                  ],
                  "stemWidth": [0.4, 0.4, 0.4, 0.4, 0.4]
                },
                "bloom": {
                  "color": [
                    [184, 194, 63],
                    [184, 194, 63],
                    [184, 194, 63],
                    [184, 194, 63],
                    [184, 194, 63]
                  ],
                  "height": [0.16, 0.12, 0.04, 0.04, 0.04],
                  "rotation": [
                    [0, 0, 0],
                    [0.03, 0, 0],
                    [-0.38, 0.07, -0.43],
                    [-0.38, 0.07, 0.07],
                    [-0.71, 0.07, -0.43]
                  ],
                  "radiusTop": [0.3, 0.39, 0.58, 1.09, 0.22],
                  "recRadius": [0.16, 0.17, 0.17, 0.2, 0.12],
                  "noiseScale": [0.46, 0.82, 1.32, 1.12, 0.72],
                  "petalCount": [1, 1, 1, 1, 1],
                  "noiseImpactX": [0.46, 0.48, 0.5, 0.5, 0.42],
                  "noiseImpactY": [0.34, 0.46, 0.68, 2.02, 2.63],
                  "noiseImpactZ": [0, 0, 1, 0.98, 0.94],
                  "radiusBottom": [0.3, 0.48, 1.03, 1.09, 0.38],
                  "radialSegments": [100, 100, 100, 91.03, 11.88]
                }
              }
            }
          }
        ]
      }</code></pre>
  </details>

  <details>
    <summary>Create a new Plant</summary>
    ENDPOINT <code>POST "/plants"</code></br>
    This Post request utilizes the plant generator micro-service
    PARAMS needed that should be sent with the post</br>
    <pre><code>
      {
        name: "Rose",
        description: "The Flower Of Love",
        plant_type: "flower1",
        position: "A1"
      }</code></pre>
    <pre><code>{
  "data": [
    {
      "id": "1",
      "type": "plant",
      "attributes": {
        "name": "Rose",
        "description": "The flower of love",
        "plant_type": "flower1",
        "planted": 1716929177,
        "lifespan": 86400000,
        "position": null,
        "phases": {
            "stem": {
              "path": [
                [
                  [0.5, 0, 0],
                  [0.5, 0, 0],
                  [0.5, 0, 0.8],
                  [0.1, 0.7, 0],
                  [0.1, 0.7, 0],
                  [0.1, 0.7, 0],
                  [0.1, 0.7, 0],
                  [0.1, 0.7, 0]
                ],
                [
                  [0.5, 0, 0],
                  [0.5, 0, 0],
                  [0.5, 0, 0.8],
                  [0.1, 1.76, 0],
                  [0.1, 1.76, 0],
                  [0.1, 1.76, 0],
                  [0.1, 1.76, 0],
                  [0.1, 1.76, 0]
                ],
                [
                  [0.5, 0, 0],
                  [0.5, 0, 0],
                  [0.5, 0, 0.8],
                  [0.1, 7, 0],
                  [0.1, 7, 0],
                  [0.1, 7, 0],
                  [0.1, 7, 0],
                  [0.1, 7, 0]
                ],
                [
                  [0.5, 0, 0],
                  [0.5, 0, 0],
                  [0.5, 0, 0.56],
                  [0.1, 4.5, 0.88],
                  [0.1, 7.46, 1.42],
                  [0.1, 8.34, 1.08],
                  [0.1, 8.42, 0],
                  [0.1, 7.08, -0.26]
                ],
                [
                  [0.5, 0, 0],
                  [0.5, 0, 0],
                  [0.5, 0, 0.56],
                  [0.1, 2.5, 0.88],
                  [0.1, 5.46, 1.42],
                  [0.1, 6.34, 1.08],
                  [0.1, 6.42, 0],
                  [0.1, 5.08, -0.26]
                ]
              ],
              "color": [
                [0, 255, 0],
                [0, 255, 0],
                [0, 255, 0],
                [0, 255, 0],
                [0, 255, 0]
              ],
              "stemWidth": [0.4, 0.4, 0.4, 0.4, 0.4]
            },
            "bloom": {
              "color": [
                [231, 172, 190],
                [231, 172, 190],
                [231, 172, 190],
                [231, 172, 190],
                [231, 172, 190]
              ],
              "height": [0.16, 0.14, 0.04, 0.04, 0.03],
              "rotation": [
                [0, 0, 0],
                [0.03, 0, 0],
                [-0.38, 0.07, -0.43],
                [-0.38, 0.07, 0.07],
                [-0.71, 0.07, -0.43]
              ],
              "radiusTop": [0.3, 0.44, 0.65, 1.09, 0.87],
              "recRadius": [0.16, 0.16, 0.18, 0.2, 0.14],
              "noiseScale": [0.46, 1.58, 1.69, 1.26, 0.19],
              "petalCount": [1, 1, 1, 1, 1],
              "noiseImpactX": [0.46, 0.47, 0.5, 0.5, 0.48],
              "noiseImpactY": [0.34, 0.5, 0.93, 2.23, 2.63],
              "noiseImpactZ": [0, 0, 1, 0.97, 0.94],
              "radiusBottom": [0.3, 0.4, 0.98, 1.09, 0.46],
              "radialSegments": [100, 100, 100, 29.35, 11.88]
            }
          }
        }
      }
    ]}</code></pre>
  </details>

  <details>
    <summary>DELETE a plant</summary>
    ENDPOINT <code>DELETE "/plants/:id"</code></br>
    This endpoint deletes a plant</br>
    Response: 
    <code>status 204</code>
  </details>

  <details>
    <summary>Breed a Plant</summary>
    This endpoint currently works with a request specifically from our frontend app, since the breeding method logic is there. </br>
    Response 
    <pre><code>{data: 
  {id: "56",
   type: "plant",
   attributes: 
    {name: "My Parents made me",
     description: "Does breeding work",
     plant_type: "combo_of_flower_1&2",
     planted: 1717184430,
     lifespan: 1,
     position: "A1",
     phases: 
      {stem: 
        {color: [0, 100, 0],
         stemWidth: [0.5, 0.5, 0.5, 0.5, 0.5],
         path: 
          [[[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.8], [0.2, 0.8, 0], [0.2, 0.8, 0], [0.2, 0.8, 0], [0.2, 0.8, 0], [0.2, 0.8, 0]],
           [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.8], [0.2, 1.76, 0], [0.2, 1.76, 0], [0.2, 1.76, 0], [0.2, 1.76, 0], [0.2, 1.76, 0]],
           [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.8], [0.2, 7, 0], [0.2, 7, 0], [0.2, 7, 0], [0.2, 7, 0], [0.2, 7, 0]],
           [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.56], [0.2, 4.5, 0.88], [0.2, 7.46, 1.42], [0.2, 8.34, 1.08], [0.2, 8.42, 0], [0.2, 7.08, -0.26]],
           [[0.6, 0, 0], [0.6, 0, 0], [0.6, 0, 0.56], [0.2, 2.5, 0.88], [0.2, 5.46, 1.42], [0.2, 6.34, 1.08], [0.2, 6.42, 0], [0.2, 5.08, -0.26]]]},
       bloom: 
        {color: [80, 100, 50],
         petalCount: [2, 2, 2, 2, 2],
         recRadius: [0.12, 0.14, 0.16, 0.18, 0.16],
         radiusTop: [0.25, 0.4, 0.9, 1.0, 0.85],
         radiusBottom: [0.25, 0.42, 0.95, 1.0, 0.32],
         noiseScale: [0.4, 1.1, 1.3, 1.2, 0.11],
         noiseImpactX: [0.4, 0.42, 0.45, 0.45, 0.41],
         noiseImpactY: [0.3, 0.4, 0.45, 1.0, 2.5],
         noiseImpactZ: [0, 0, 0.95, 0.95, 0.9],
         height: [0.14, 0.08, 0.03, 0.03, 0.01],
         radialSegments: [90, 90, 90, 20, 10],
         rotation: [[0, 0, 0], [0.03, 0, 0], [-0.35, 0.07, -0.4], [-0.35, 0.07, 0.07], [-0.68, 0.07, -0.4]]}}}}}</code></pre>
  </details>

  <details>
    <summary>Get Plants For a User</summary>
    Gets all plants for a specific user 
    ENDPOINT <code>"/users/:user_id/plants"</code>
    Response: 
    <pre><code>{:data: 
  [{id: "67",
    type: "plant",
    attributes: 
     {name: "rose",
      description: "The Flower of love",
      plant_type: "flower1",
      planted: 1717436725,
      lifespan: 86400000,
      position: "A1",
      phases: 
       {stem: 
         {path: 
           [[[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0]],
            [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0]],
            [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0]],
            [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.56], [0.1, 4.5, 0.88], [0.1, 7.46, 1.42], [0.1, 8.34, 1.08], [0.1, 8.42, 0], [0.1, 7.08, -0.26]],
            [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.56], [0.1, 2.5, 0.88], [0.1, 5.46, 1.42], [0.1, 6.34, 1.08], [0.1, 6.42, 0], [0.1, 5.08, -0.26]]],
          color: [[0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0]],
          stemWidth: [0.4, 0.4, 0.4, 0.4, 0.4]},
        bloom: 
         {color: [[127, 141, 164], [127, 141, 164], [127, 141, 164], [127, 141, 164], [127, 141, 164]],
          height: [0.16, 0.04, 0.04, 0.04, 0.04],
          rotation: [[0, 0, 0], [0.03, 0, 0], [-0.38, 0.07, -0.43], [-0.38, 0.07, 0.07], [-0.71, 0.07, -0.43]],
          radiusTop: [0.3, 0.33, 0.75, 1.09, 0.78],
          recRadius: [0.16, 0.16, 0.19, 0.2, 0.16],
          noiseScale: [0.46, 0.87, 1.51, 1.11, 0.68],
          petalCount: [1, 1, 1, 1, 1],
          noiseImpactX: [0.46, 0.49, 0.5, 0.5, 0.48],
          noiseImpactY: [0.34, 0.35, 0.83, 2.46, 2.63],
          noiseImpactZ: [0, 0, 0, 0.97, 0.94],
          radiusBottom: [0.3, 0.46, 0.59, 1.09, 0.82],
          radialSegments: [100, 100, 100, 24.34, 11.88]}}}},
          {etc... user plant data}]}</code></pre>
  </details>

  <details>
    <summary>Get One User Plant</summary>
    ENDPOINT <code>"/users/user_id/plants/:id"</code>
    This Gets on Specific plant from a user
    Response: 
    <pre><code>{data: 
  {id: "77",
   type: "plant",
   attributes: 
    {name: "Rose",
     description: "The Flower of love",
     plant_type: "flower1",
     planted: 1717436725,
     lifespan: 86400000,
     position: "A1",
     phases: 
      {stem: 
        {path: 
          [[[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0]],
           [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0]],
           [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0]],
           [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.56], [0.1, 4.5, 0.88], [0.1, 7.46, 1.42], [0.1, 8.34, 1.08], [0.1, 8.42, 0], [0.1, 7.08, -0.26]],
           [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.56], [0.1, 2.5, 0.88], [0.1, 5.46, 1.42], [0.1, 6.34, 1.08], [0.1, 6.42, 0], [0.1, 5.08, -0.26]]],
         color: [[0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0]],
         stemWidth: [0.4, 0.4, 0.4, 0.4, 0.4]},
       bloom: 
        {color: [[37, 161, 4], [37, 161, 4], [37, 161, 4], [37, 161, 4], [37, 161, 4]],
         height: [0.16, 0.09, 0.04, 0.04, 0.01],
         rotation: [[0, 0, 0], [0.03, 0, 0], [-0.38, 0.07, -0.43], [-0.38, 0.07, 0.07], [-0.71, 0.07, -0.43]],
         radiusTop: [0.3, 0.48, 0.79, 1.09, 0.38],
         recRadius: [0.16, 0.16, 0.18, 0.2, 0.15],
         noiseScale: [0.46, 1.53, 1.45, 1.16, 0.7],
         petalCount: [1, 1, 1, 1, 1],
         noiseImpactX: [0.46, 0.49, 0.5, 0.5, 0.49],
         noiseImpactY: [0.34, 0.45, 0.84, 1.14, 2.63],
         noiseImpactZ: [0, 0, 1, 0.98, 0.94],
         radiusBottom: [0.3, 0.51, 1.01, 1.09, 1.09],
         radialSegments: [100, 100, 100, 79.25, 11.88]}}}}}</code></pre>
  </details>

### Plant Generator Micro-Service 
  We developed a plant generator for our `POST "/plants"` endpoint to streamline the creation of plant objects. This allows our frontend team to only send the parameters `:name, :description, :plant_type, and :position.` The generator then randomly produces the other attributes, ensuring each plant is unique. 

  Check out our Plant Generator [Repo](https://github.com/2311-capstone-bloom-brothers/bloom-brothers-be-generator)

### Front End Repo
  [This](https://github.com/2311-capstone-bloom-brothers/bloom-brothers-fe) is where you can find our frontend repo and play our Plant Simulator! 
  
### Contributors 
  Sam Puttman [GitHub](https://github.com/SamPuttman) || [LinkedIn](https://www.linkedin.com/in/samuel-puttman/)

  Jose "Joey" Reyes [GitHub](https://github.com/JRIV-10) || [LinkedIn](https://www.linkedin.com/in/josereyes10/)

  Tom Coney [Github](https://github.com/tconey23) || [LinkedIn](http://www.linkedin.com/in/tom-ce-coney)

  Edwin Chalmers [Github](https://github.com/edwin-chalmers/) || [LinkedIn](https://www.linkedin.com/in/edwinchalmers/)

  Adam C. Bedient [Github](https://github.com/cOdeBedient) || [LinkedIn](https://www.linkedin.com/in/adam-bedient/)