def get_freight
  @freight = Correios::Frete::Calculador.new do |f|
	  f.cep_origem = @cep_origin
	  f.cep_destino = @cep_destiny
	  f.peso = @product.weight
	  f.comprimento = @product.lenght
	  f.largura = @product.width
	  f.altura = @product.height
	end

	@freight = @freight.calcular @delivery_type.to_sym

	verify_data

	if @data_is_valid
		set_freight_data
	end
end

def set_freight_data
	@product.freight_price = @freight.valor
	@product.freight_delivery_time = @freight.prazo_entrega
end

def verify_data
	@data_is_valid = true

	unless @freight.erro == "0"
		@error = @freight.msg_erro
		@data_is_valid = false
	end
end

def verify_delivery_type
	@delivery_type_is_valid = true

	unless ([	"pac",
						"pac_com_contrato",
						"pac_com_contrato_2",
						"pac_gf",
						"sedex",
						"sedex_a_cobrar",
						"sedex_a_cobrar_com_contrato",
						"sedex_10",
						"sedex_hoje",
						"sedex_com_contrato_1",
						"sedex_com_contrato_2",
						"sedex_com_contrato_3",
						"sedex_com_contrato_4",
						"sedex_com_contrato_5",
						"sedex_com_contrato_6",
						"e_sedex",
						"e_sedex_prioritario",
						"e_sedex_expres",
						"e_sedex_grupo_1",
						"e_sedex_grupo_2",
						"e_sedex_grupo_3"].include?(@delivery_type))
	
		@error_delivery_type = "Forma de envio inválida."

		@delivery_type_is_valid = false
	end
end
