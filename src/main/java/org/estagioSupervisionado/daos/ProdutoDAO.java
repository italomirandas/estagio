package org.estagioSupervisionado.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.estagioSupervisionado.model.Produto;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ProdutoDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Produto produto){
		manager.persist(produto);
		
	}

	public List<Produto> listar() {
		
		return manager.createQuery("select p from Produto p", Produto.class).getResultList();
	}
	
}
