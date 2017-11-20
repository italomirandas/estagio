<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<html>

<head>

<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<title>Loja de Livros</title>

<c:url value="/" var="contextPath" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/layout/stylesheets/vendors.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/layout/stylesheets/algaworks.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/layout/stylesheets/application.css"/>

<link rel="stylesheet" type="text/css" href="${contextPath}resources/static/stylesheets/estagio.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}resources/static/stylesheets/vendors/upload.min.css"/>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/static/javascripts/jquery-2.2.3.js"></script>

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
	          <a href="#" class="js-sidebar-toggle">  <i class="fa  fa-bars"></i>    </a>
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
	
	<section class="aw-layout-content  js-content">

		<div class="page-header">
			<div class="container-fluid">
				<h1>
					Cadastro de Produto
				</h1>
			</div>
		</div>
	
		<div class="container-fluid">
	
		<form:form method="POST" action="${s:mvcUrl('PC#gravar').build() }"	commandName="produto" enctype="multipart/form-data" class="form-vertical  js-form-loading">
			<div class="form-group">
				<label>Título</label>
				<input type="text" name="titulo" class="form-control">
				<form:errors path="titulo" />
			</div>
			<div class="form-group">
				<label>Descrição</label>
				<textarea row="10" cols="20" name="descricao" class="form-control"></textarea>
				<form:errors path="descricao" />
			</div>
			<div class="form-group">
					<label>Páginas</label>
					<div class="row">
						<div class="col-md-2">
							<input type="text" name="paginas" class="form-control">
							<form:errors path="paginas" />
						</div>
						<div class="col-md-10"></div>
					</div>
			</div>
			<div class="form-group">
				<c:forEach items="${tipos }" var="tipoPreco" varStatus="status">
					<div class="col-md-4">
						<label>${tipoPreco}</label>
						<input type="text" name="precos[${status.index}].valor" class="form-control">
						<input type="hidden" name="precos[${status.index}].tipo"	value="${tipoPreco }"	class="form-control">
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="form-group	col-sm-12">
					<input type="hidden"	name="nomeFoto"	value="${nomeFoto }">
					<input type="hidden"	name="contentType"	value="${contentType }">
					
					<label class="control-label">Foto</label>
					
					<div class="js-container-foto-cerveja">
						<div id="upload-drop" class="bw-upload">
							<i class="glyphicon glyphicon-cloud-upload"></i>
							<span>Arraste a foto aqui ou </span>
							<a class="bw-upload-form-file">selecione 
								<input id="upload-select" type="file" name="sumario" accept=".jpg,.jpeg,.png" />
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<button class="but btn-primary" type="submit">Cadastrar</button>
			</div>
		</form:form>
		</div>
		
		<c:import url="/WEB-INF/views/handlebars/FotoCerveja.jsp"/>
		
	</section>
	
	<footer class="aw-layout-footer  js-content">
		<div class="container-fluid">
			<span class="aw-footer-disclaimer">&copy; 2016 AlgaWorks. Todos os direitos reservados.</span>
		</div>
	</footer>
</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/javascripts/vendors/uikit.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/javascripts/vendors/upload.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/javascripts/vendors/handlebars.min.js"></script>

	<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
	  	var header = $("meta[name='_csrf_header']").attr("content");
		
	  	$(function() {			
			var settings = {
				type : 'json',
				filelimit : 1,
				allow : '*.(jpg|jpeg|png)',
				action : '/estagioSupervisionado/fotos',
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				complete: function(resposta){
					var inputNomeFoto = $('input[name=nomeFoto]');
					var inputContentType = $('input[name=contentType]');
					
					var htmlFotoCervejaTemplate = $('#foto-cerveja').html();
					var template = Handlebars.compile(htmlFotoCervejaTemplate);
					var htmlFotoCerveja = template({nomeFoto: resposta.nomeFoto});
					
					var containerFotoCerveja = $('.js-container-foto-cerveja');
					
					var uploadDrop = $('#upload-drop');
					
					inputNomeFoto.val(resposta.nomeFoto);
					inputContentType.val(resposta.contentType);
					
					uploadDrop.addClass('hidden');
					containerFotoCerveja.append(htmlFotoCerveja);
					
					$('.js-remove-foto').on('click', function(){
						$('.js-foto-cerveja').remove();
						uploadDrop.removeClass('hidden');
						inputNomeFoto.val('');
						inputContentType.val('');
					});
				}
			};

			UIkit.uploadSelect($('#upload-select'), settings);
			UIkit.uploadDrop($('#upload-drop'), settings);
			
		});
	</script>
</body>
</html>