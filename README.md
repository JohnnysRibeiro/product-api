# API for Product CRUD and integrating with correios-frete gem

* Ruby version

```sh
ruby 2.3.1p112
```


* Rails version

```sh
Rails 5.0.7
```
* Configuration

After downloading the project, run

```sh
$ bundle install
```

to install the dependencies.

Then, run the migrations with

```sh
$ rake db:migrate
```

To run the server, use

```sh
rails s
```

* How to run the test suite

To run the test  suite, run

```sh
$ bundle exec rspec
```

* Services 

There are 2 main endpoints in this API, the create endpoint, and the check the delivery information endpoint. You can test them with [HTTPie](https://httpie.org/).

To test the create endpoint, after starting the server, use

```sh
$ http POST :3000/products [:params]
```
The parameters are: name, description, lenght, height, width, weight and price.

All the measurements are in centimeters.

As per restrictions in the Correios webservice, the height cannot be less than 2, the lenght cannot be less than 16 and the width cannot be less than 11.

To test the delivery information endpoint, use

```sh
$ http GET :3000/products/delivery/:id [:params]
```

The parameters are: cep_origin, cep_destiny, delivery_type.

The delivery type must be one these:

```
pac                         # 04510 - PAC sem contrato
pac_com_contrato            # 41068 - PAC com contrato
pac_com_contrato_2          # 04669 - PAC com contrato
pac_gf                      # 41300 - PAC para grandes formatos
sedex                       # 04014 - SEDEX sem contrato
sedex_a_cobrar              # 40045 - SEDEX a Cobrar, sem contrato
sedex_a_cobrar_com_contrato # 40126 - SEDEX a Cobrar, com contrato
sedex_10                    # 40215 - SEDEX 10, sem contrato
sedex_hoje                  # 40290 - SEDEX Hoje, sem contrato
sedex_com_contrato_1        # 40096 - SEDEX com contrato
sedex_com_contrato_2        # 40436 - SEDEX com contrato
sedex_com_contrato_3        # 40444 - SEDEX com contrato
sedex_com_contrato_4        # 40568 - SEDEX com contrato
sedex_com_contrato_5        # 40606 - SEDEX com contrato
sedex_com_contrato_6        # 04162 - SEDEX com contrato
e_sedex                     # 81019 - e-SEDEX, com contrato
e_sedex_prioritario         # 81027 - e-SEDEX Prioritário, com contrato
e_sedex_express             # 81035 - e-SEDEX Express, com contrato
e_sedex_grupo_1             # 81868 - (Grupo 1) e-SEDEX, com contrato
e_sedex_grupo_2             # 81833 - (Grupo 2) e-SEDEX, com contrato
e_sedex_grupo_3             # 81850 - (Grupo 3) e-SEDEX, com contrato
```
