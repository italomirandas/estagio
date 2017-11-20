package org.estagioSupervisionado.dto;

public class FotoDTO {

	private String nomeFoto;
	private String contentType;

	public FotoDTO(String nomeFoto, String contentType) {
		this.nomeFoto = nomeFoto;
		this.contentType = contentType;
	}

	public final String getNomeFoto() {
		return nomeFoto;
	}

	public final void setNomeFoto(String nomeFoto) {
		this.nomeFoto = nomeFoto;
	}

	public final String getContentType() {
		return contentType;
	}

	public final void setContentType(String contentType) {
		this.contentType = contentType;
	}

}
