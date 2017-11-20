package org.estagioSupervisionado.storage.local;

import static java.nio.file.FileSystems.getDefault;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import org.estagioSupervisionado.storage.FotoStorage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FotoStorageLocal implements FotoStorage {

	private static final Logger logger = LoggerFactory.getLogger(FotoStorageLocal.class);
	
	private Path local;
	private Path localTemporario;
	
	public FotoStorageLocal(){
		this(getDefault().getPath(System.getenv("HOME"), ".produtofotos"));
	}
	
	public FotoStorageLocal(Path path){
		this.local = path;
		criarPastas();
	}
	
	@Override
	public String salvarTemporariamente(MultipartFile[] files){
		System.out.println(">>>>> salvando a foto temporariamente...");

		System.out.println("Diretório HOME = " + local.getParent().toString());
		System.out.println("Diretório onde salva = " + localTemporario.toString());
		
		String novoNome = null;
		
		if (files != null && files.length > 0){
			
			MultipartFile arquivo = files[0];
			novoNome = renomearArquivo(arquivo.getOriginalFilename());
			try {
				arquivo.transferTo(new File(this.localTemporario.toAbsolutePath().toString() + getDefault().getSeparator() + novoNome ));
			}  catch (IOException e) {
				throw new RuntimeException ("Erro salvando a foto na pasta temporária", e);
			}
			
		} 
		
		return novoNome;
		
	}
	
	@Override
	public byte[] recuperarFotoTemporaria(String nomeFoto) {
		try {
			return Files.readAllBytes(this.localTemporario.resolve(nomeFoto));
		} catch (IOException e) {
			throw new RuntimeException("Erro lendo a foto temporária", e);
		}
	}
	
	private void criarPastas() {
		try {
			Files.createDirectories(this.local);
			this.localTemporario = getDefault().getPath(this.local.toString(), "temp");
			Files.createDirectories(this.localTemporario);
			// Obs  Files.createTempDirectory(prefix,attrs) ->  mas não queremos que nosso diretório seja apagado imediatamente
			
			if (logger.isDebugEnabled()){
				
				logger.debug("Pastas criadas para salvar fotos.");
				logger.debug("Pasta default: " + this.local.toAbsolutePath());
				logger.debug("Pasta temporária: " + this.localTemporario.toAbsolutePath());
				
			}
		} catch (IOException e) {
			throw new RuntimeException("erro criando pasta para salvar foto", e);
		}
	}
	
	private String renomearArquivo(String nomeOriginal) {
		String novoNome = UUID.randomUUID().toString() + "_" + nomeOriginal;
		
		if (logger.isDebugEnabled()){
			logger.debug(String.format("Nome original: %s", "novo nome: %s", nomeOriginal, novoNome));
		}
		
		return novoNome;
	}
	
	
}