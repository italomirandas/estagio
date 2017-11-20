package org.estagioSupervisionado.model;

import java.math.BigDecimal;

import javax.persistence.Embeddable;

@Embeddable   //Por causa do Relacionamento no DB
public class Preco {

	private BigDecimal valor;
	private TipoPreco tipo;

	public final BigDecimal getValor() {
		return valor;
	}

	public final void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public final TipoPreco getTipo() {
		return tipo;
	}

	public final void setTipo(TipoPreco tipo) {
		this.tipo = tipo;
	}
}
