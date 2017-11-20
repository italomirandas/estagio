<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>

	<title>AlgaWorks</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/layout/stylesheets/vendors.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/layout/stylesheets/algaworks.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/layout/stylesheets/application.css"/>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>
<div class="aw-layout-page">

	<nav class="navbar  navbar-fixed-top  navbar-default  js-sticky-reference" id="main-navbar">
	  <div class="container-fluid">

		<div class="navbar-header">
	      <a class="navbar-brand  hidden-xs" href="#">
	        <img alt="AlgaWorks" src="${pageContext.request.contextPath}/resources/static/layout/images/logo.png"/>
	      </a>

	      <ul class="nav  navbar-nav">
	        <li>
	          <a href="#" class="js-sidebar-toggle">  s<i class="fa  fa-bars"></i>    </a>
	        </li>
	      </ul>
		</div>

	    <ul class="nav navbar-nav  navbar-right">
	      <li>
	        <a href="#"><em class="fa  fa-sign-out"></em></a>
	      </li> 
	    </ul>

	  </div>
	</nav>

	<aside class="aw-layout-sidebar  js-sidebar">
		<div class="aw-layout-sidebar__content">

	    	<nav class="aw-menu  js-menu">
	      		<ul class="aw-menu__list">
	
	        		<li class="aw-menu__item">
	         			 <a href="dashboard.html"><i class="fa  fa-fw  fa-home"></i><span>Dashboard</span></a>
	        		</li>
	
	        		<li class="aw-menu__item  is-active">
	         			<a href="#">
	            			<i class="fa  fa-fw  fa-file-text"></i><span>Cadastros</span>
	            			<i class="aw-menu__navigation-icon  fa"></i>
	          			</a>
	      
	          			<ul class="aw-menu__list  aw-menu__list--sublist">
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="cadastro-produto.html">Cadastro de produto</a></li>
	            			<li class="aw-menu__item  aw-menu__item--link  is-active"><a href="pesquisa-produtos.html">Pesquisa de produtos</a></li>
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="tabela-sem-dados.html">Tabela sem dados</a></li>
	         		 	</ul>
	        		</li>
	
	        		<li class="aw-menu__item  is-expanded">
	         			<a href="#">
	            			<i class="fa  fa-fw  fa-file-text"></i><span>P�ginas comuns</span>
	            			<i class="aw-menu__navigation-icon  fa"></i>
	          			</a>
	
	         			<ul class="aw-menu__list  aw-menu__list--sublist">
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="pagina-vazia.html">P�gina vazia</a></li>
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="login.html">Login</a></li>
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="esqueceu-a-senha.html">Esqueceu a senha</a></li>
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="403.html">403</a></li>
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="404.html">404</a></li>
	            			<li class="aw-menu__item  aw-menu__item--link"><a href="500.html">500</a></li>
	          			</ul>
	        		</li>
	
	      		</ul>
			</nav>
		
		</div>
	</aside>

	<section class="aw-layout-content  js-content">

		<div class="page-header">
			<div class="container-fluid">
				<h1>
					Cadastro de Cerveja
				</h1>
			</div>
		</div>
	
		<div class="container-fluid">
	
			<!-- <div class="alert  alert-danger  alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<i class="fa  fa-exclamation-circle"></i> Já existe um produto com o nome informado.
			</div> -->
	
			<form method="POST" commandName="cerveja" class="form-vertical  js-form-loading">
				
				<div class="form-group">
					<label for="input-produto-nome">Nome</label>
					<input id="input-produto-nome" type="text" class="form-control"/>
				</div>
		
				<div class="form-group">
					<label for="input-produto-descricao">Descri��o</label>
					<textarea id="input-produto-descricao" rows="3" class="form-control"></textarea>
				</div>
		
				<div class="row">
					<div class="col-sm-3">
						<div class="form-group">
							<label for="input-produto-preco">Pre�o unit�rio</label>
							<input id="input-produto-preco" type="text" class="form-control" placeholder="R$"/>
						</div>
					</div>
					
					<div class="col-sm-3">
						<div class="form-group">
							<label for="input-produto-estoque">Estoque</label>
							<input id="input-produto-estoque" type="text" class="form-control" placeholder="Unidades"/>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<button class="btn  btn-primary" type="submit">Salvar</button>
				</div>
		
			</form>
		</div>
	</section>
	
	<footer class="aw-layout-footer  js-content">
		<div class="container-fluid">
			<span class="aw-footer-disclaimer">&copy; 2016 AlgaWorks. Todos os direitos reservados.</span>
		</div>
	</footer>
</div>

<script src="${pageContext.request.contextPath}/resources/static/layout/javascripts/vendors.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/layout/javascripts/algaworks.min.js"></script>

</body>
</html>