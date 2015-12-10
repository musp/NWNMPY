window.NWNMapp.controller('NWNMpiramideTopControll', function ($scope, $rootScope,$layout, $layoutToggles, $pageLoadingBar,Fullscreen) {

		$rootScope.isLoginPage        = false;
		$rootScope.isLightLoginPage   = false;
		$rootScope.isLockscreenPage   = false;
		$rootScope.isMainPage         = true;

		$rootScope.layoutOptions = {
			horizontalMenu: {
				isVisible		: false,
				isFixed			: true,
				minimal			: false,
				clickToExpand	: false,

				isMenuOpenMobile: false
			},
			sidebar: {
				isVisible		: true,
				isCollapsed		: false,
				toggleOthers	: true,
				isFixed			: true,
				isRight			: false,

				isMenuOpenMobile: false,

				// Added in v1.3
				userProfile		: true
			},
			chat: {
				isOpen			: false,
			},
			settingsPane: {
				isOpen			: false,
				useAnimation	: true
			},
			container: {
				isBoxed			: false
			},
			skins: {
				sidebarMenu		: '',
				horizontalMenu	: '',
				userInfoNavbar	: ''
			},
			pageTitles: true,
			userInfoNavVisible	: false
		};

		$layout.loadOptionsFromCookies(); // remove this line if you don't want to support cookies that remember layout changes


		$scope.updatePsScrollbars = function()
		{
			var $scrollbars = jQuery(".ps-scrollbar:visible");

			$scrollbars.each(function(i, el)
			{
				if(typeof jQuery(el).data('perfectScrollbar') == 'undefined')
				{
					jQuery(el).perfectScrollbar();
				}
				else
				{
					jQuery(el).perfectScrollbar('update');
				}
			})
		};


		// Define Public Vars
		public_vars.$body = jQuery("body");


		// Init Layout Toggles
		$layoutToggles.initToggles();


		// Other methods
		$scope.setFocusOnSearchField = function()
		{
			public_vars.$body.find('.search-form input[name="s"]').focus();

			setTimeout(function(){ public_vars.$body.find('.search-form input[name="s"]').focus() }, 100 );
		};


		// Watch changes to replace checkboxes
		$scope.$watch(function()
		{
			cbr_replace();
		});

		// Watch sidebar status to remove the psScrollbar
		$rootScope.$watch('layoutOptions.sidebar.isCollapsed', function(newValue, oldValue)
		{
			if(newValue != oldValue)
			{
				if(newValue == true)
				{
					public_vars.$sidebarMenu.find('.sidebar-menu-inner').perfectScrollbar('destroy')
				}
				else
				{
					public_vars.$sidebarMenu.find('.sidebar-menu-inner').perfectScrollbar({wheelPropagation: public_vars.wheelPropagation});
				}
			}
		});


		// Page Loading Progress (remove/comment this line to disable it)
		$pageLoadingBar.init();

		$scope.showLoadingBar = showLoadingBar;
		$scope.hideLoadingBar = hideLoadingBar;


		// Set Scroll to 0 When page is changed
		$rootScope.$on('$stateChangeStart', function()
		{
			var obj = {pos: jQuery(window).scrollTop()};

			TweenLite.to(obj, .25, {pos: 0, ease:Power4.easeOut, onUpdate: function()
			{
				$(window).scrollTop(obj.pos);
			}});
		});


		// Full screen feature added in v1.3
		$scope.isFullscreenSupported = Fullscreen.isSupported();
		$scope.isFullscreen = Fullscreen.isEnabled() ? true : false;

		$scope.goFullscreen = function()
		{
			if (Fullscreen.isEnabled())
				Fullscreen.cancel();
			else
				Fullscreen.all();

			$scope.isFullscreen = Fullscreen.isEnabled() ? true : false;
		}


    $scope.NWNMpiramideTop = {};
    $scope.NWNMpiramideTop.labelCabecalho = "TOPO PIRÂMIDE";
    $scope.NWNMpiramideTop.vorticeCorrente = "../NWNMhtml/NWNMpiramideFrenteD.html";
    $scope.cabecalhoFrenteD = "FRENTE DIREITA PIRÂMIDE";
    $scope.MenusAjudaEscritura = [];
    $scope.AjudaEscritura = [];
    $scope.AjudaAtualEscritura = '';
    $scope.AtualizaMenuEscritura = function (Menu) {
        $scope.AjudaAtualEscritura = Menu.Url;
    };
    $scope.FecharAjudaAtualEscritura = function () {
        $scope.AjudaAtualEscritura = '';
    };
    /*$scope.MenusAjudaEscritura.push({
        Id: 1,
        Titulo: "Permissões",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/Permissoes.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 2,
        Titulo: "Caixa",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/Caixa.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 3,
        Titulo: "Atendimento",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/Atendimento.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 4,
        Titulo: "Funcionalidades Padrões de Escritura",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/FuncionalidadesPadroesEscritura.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 5,
        Titulo: "Passo Natureza",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/PassoNatureza.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 6,
        Titulo: "Passo Partes Envolvidas",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/PassoPartesEnvolvidas.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 7,
        Titulo: "Passo Objetos Envolvidos",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/PassoObjetosEnvolvidos.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 8,
        Titulo: "Passo Relacionamento de Partes",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/PassoRelacionamentoPartes.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 9,
        Titulo: "Passo Relacionamento de Objetos",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/PassoRelacionamentoObjetos.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 10,
        Titulo: "Passo Textos Auxiliares",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/PassoTextosAuxiliares.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 11,
        Titulo: "Passo Finalização",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/PassoFinalizacao.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 12,
        Titulo: "Protocolo",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/Protocolo.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    }, {
        Id: 13,
        Titulo: "Edição Escritura",
        ClassDiv: "col col-6",
        ClassBtn: "button-win button-notas",
        ClassIcone: "glyphicon icon-GlanzNotas",
        Url: "/Documentacao/Escrituras/Modais/EdicaoEscritura.html",
        IsVoltar: false,
        PermissaoAcesso: true,
        IdentificaModuloPai: 0
    });
    $scope.AjudaEscritura.canvasManutencaoEscritura = function () {
        var c = document.getElementById("canvasManutencaoEscritura");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1280, 530);
        ctx.fillText("2", 200, 130);
        ctx.fillText("3", 1250, 30);
    };
    $scope.AjudaEscritura.canvasAtendimento = function () {
        var c = document.getElementById("canvasAtendimento");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 50, 110);
        ctx.fillText("2", 300, 110);
        ctx.fillText("3", 565, 110);
        ctx.fillText("4", 800, 110);
        ctx.fillText("5", 1200, 110);
        ctx.fillText("6", 1250, 110);
    };
    $scope.AjudaEscritura.canvasAtendimentoEdt = function () {
        var c = document.getElementById("canvasAtendimentoEdt");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'red';
        ctx.fillText("1", 600, 30);
        ctx.fillText("2", 1200, 135);
    };
    $scope.AjudaEscritura.canvasAtendimentoEdicao = function () {
        var c = document.getElementById("canvasAtendimentoEdicao");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 50, 110);
        ctx.fillText("2", 300, 110);
        ctx.fillText("3", 565, 110);
        ctx.fillText("4", 800, 110);
        ctx.fillText("5", 1200, 110);
        ctx.fillText("6", 1250, 110);
    };
    $scope.AjudaEscritura.canvasNatureza1 = function () {
        var c = document.getElementById("canvasNatureza1");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 650, 120);
        ctx.fillText("2", 800, 120);
        ctx.fillText("3", 1250, 120);
        ctx.fillText("4", 1310, 120);
    };
    $scope.AjudaEscritura.canvasSelecionaNatureza = function () {
        var c = document.getElementById("canvasSelecionaNatureza");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("A", 60, 110);
        ctx.fillText("B", 505, 210);
        ctx.fillText("C", 555, 525);
    };
    $scope.AjudaEscritura.canvasNaturezaSelecionada = function () {
        var c = document.getElementById("canvasNaturezaSelecionada");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1250, 222);
        ctx.fillText("2", 1310, 222);
    };
    $scope.AjudaEscritura.canvasPartesEnvolvidas = function () {
        var c = document.getElementById("canvasPartesEnvolvidas");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 700, 110);
        ctx.fillText("2", 1245, 110);
    };
    $scope.AjudaEscritura.canvasPartesEnvolvidasSelecionada = function () {
        var c = document.getElementById("canvasPartesEnvolvidasSelecionada");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1210, 220);
        ctx.fillText("2", 1255, 220);
    };
    $scope.AjudaEscritura.canvasObjetosEnvolvidos1 = function () {
        var c = document.getElementById("canvasObjetosEnvolvidos1");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 50, 110);
        ctx.fillText("2", 300, 120);
        ctx.fillText("3", 540, 120);
        ctx.fillText("4", 800, 120);
        ctx.fillText("5", 1260, 95);
        ctx.fillText("6", 300, 200);
        ctx.fillText("7", 540, 200);
        ctx.fillText("8", 800, 200);
    };
    $scope.AjudaEscritura.canvasCadastroImovel = function () {
        var c = document.getElementById("canvasCadastroImovel");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("A", 100, 130);
        ctx.fillText("B", 300, 130);
        ctx.fillText("C", 500, 130);
        ctx.fillText("D", 700, 130);
        ctx.fillText("E", 950, 130);
        ctx.fillText("F", 500, 230);
        ctx.fillText("G", 100, 45);
        ctx.fillText("H", 1200, 45);
        ctx.fillText("I", 1250, 45);
    };
    $scope.AjudaEscritura.canvasCadastroImovelRural = function () {
        var c = document.getElementById("canvasCadastroImovelRural");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("B.1", 200, 130);
        ctx.fillText("B.2", 600, 130);
        ctx.fillText("B.3", 1020, 130);
        ctx.fillText("B.4", 45, 165);
        ctx.fillText("B.5", 160, 210);
        ctx.fillText("B.6", 250, 290);
        ctx.fillText("B.7", 1070, 290);
        ctx.fillText("B.8", 250, 380);
        ctx.fillText("B.9", 900, 380);
    };
    $scope.AjudaEscritura.canvasCadastroImovelAutorizacaoExtrangeira = function () {
        var c = document.getElementById("canvasCadastroImovelAutorizacaoExtrangeira");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("B.5.1", 90, 310);
        ctx.fillText("B.5.2", 600, 310);
        ctx.fillText("B.5.3", 1050, 310);
    };
    $scope.AjudaEscritura.canvasPartesEnvolvidasSelecionada = function () {
        var c = document.getElementById("canvasPartesEnvolvidasSelecionada");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1210, 220);
        ctx.fillText("2", 1255, 220);
    };
    $scope.AjudaEscritura.canvasRelacionamentoPartes1 = function () {
        var c = document.getElementById("canvasRelacionamentoPartes1");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 55, 170);
        ctx.fillText("2", 1230, 160);
        ctx.fillText("3", 1090, 410);
    };
    $scope.AjudaEscritura.canvasSelecionaFuncao = function () {
        var c = document.getElementById("canvasSelecionaFuncao");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("A", 345, 135);
    };
    $scope.AjudaEscritura.canvasSelecionaFuncao1 = function () {
        var c = document.getElementById("canvasSelecionaFuncao1");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("A.1", 600, 90);
        ctx.fillText("A.2", 100, 160);
    };
    $scope.AjudaEscritura.canvasRelacionarPartesPrincipais = function () {
        var c = document.getElementById("canvasRelacionarPartesPrincipais");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1210, 95);
    };
    $scope.AjudaEscritura.canvasRelacionarPartesSecundarias2 = function () {
        var c = document.getElementById("canvasRelacionarPartesSecundarias2");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("A", 600, 30);
        ctx.fillText("B", 300, 100);
        ctx.fillText("C", 800, 145);
    };
    $scope.AjudaEscritura.canvasRelacionamentoObjetos1 = function () {
        var c = document.getElementById("canvasRelacionamentoObjetos1");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'red';
        ctx.fillText("1", 420, 190);
        ctx.fillText("2", 490, 190);
        ctx.fillText("3", 880, 190);
        ctx.fillText("4", 1200, 190);
        ctx.fillStyle = 'blue';
        ctx.fillText("5", 1250, 190);
        ctx.fillText("6", 1250, 240);
    };
    $scope.AjudaEscritura.canvasTextosAuxiliares1 = function () {
        var c = document.getElementById("canvasTextosAuxiliares1");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'red';
        ctx.fillText("1", 1270, 200);
    };
    $scope.AjudaEscritura.canvasEditorDeTextosAuxiliares = function () {
        var c = document.getElementById("canvasEditorDeTextosAuxiliares");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1.A", 1210, 30);
        ctx.fillText("1.B", 1260, 30);
    };
    $scope.AjudaEscritura.canvasFinalizacaoCorpo = function () {
        var c = document.getElementById("canvasFinalizacaoCorpo");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1270, 90);
        ctx.fillText("2", 600, 130);
        ctx.fillText("3", 300, 225);
        ctx.fillText("4", 1000, 225);
    };
    $scope.AjudaEscritura.canvasFinalizacaoEdicaoRemontagemCorpoLavratura = function () {
        var c = document.getElementById("canvasFinalizacaoEdicaoRemontagemCorpoLavratura");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1135, 115);
        ctx.fillText("2", 1180, 115);
        ctx.fillText("3", 1230, 115);
        ctx.fillText("4", 1280, 115);
    };
    $scope.AjudaEscritura.canvasRetificacaoLivroTraslado = function () {
        var c = document.getElementById("canvasRetificacaoLivroTraslado");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 1042, 120);
        ctx.fillText("2", 1115, 120);
        ctx.fillText("3", 1170, 120);
        ctx.fillText("4", 1250, 120);
    };
    $scope.AjudaEscritura.canvasGeracaoProtocolo = function () {
        var c = document.getElementById("canvasGeracaoProtocolo");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'red';
        ctx.fillText("1", 1190, 50);
    };
    $scope.AjudaEscritura.canvasFiltroEdicaoEscritura = function () {
        var c = document.getElementById("canvasFiltroEdicaoEscritura");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("1", 170, 160);
        ctx.fillText("2", 160, 220);
        ctx.fillText("3", 800, 160);
        ctx.fillText("4", 1105, 160);
        ctx.fillText("5", 800, 220);
        ctx.fillText("6", 1220, 220);
        ctx.fillText("8", 650, 300);
    };
    $scope.AjudaEscritura.canvasEscriturasParaSelecao = function () {
        var c = document.getElementById("canvasEscriturasParaSelecao");
        var ctx = c.getContext("2d");
        ctx.font = "30px Arial";
        ctx.fillStyle = 'blue';
        ctx.fillText("A", 1210, 40);
        ctx.fillText("B", 1250, 40);
        ctx.fillText("C", 1152, 135);
        ctx.fillText("D", 1250, 135);
    };*/

});
