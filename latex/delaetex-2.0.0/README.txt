				DeLaeTeX
Pacote LaTeX para formatacao de documentos para o DELAE/EE/UFRGS e PPGEE/EE/UFRGS
        Copyright (C) 2004..2016 Walter Fetter Lages <fetter@ece.ufrgs.br>

Estes arquivos compoem o pacote de estilos LaTeX de documentos para o
DELAE/EE/UFRGS e PPGEE/EE/UFRGS.  Na medida do possivel tambem sao
suportados documentos para o DELET/EE/UFRGS, por questoes de compatibilidade
com as versoes anteriores.  Os estilos foram adaptados a partir do pacote
iiufrgs versao 4.2.0, que gera documentos conforme os padroes do II/UFRGS. 
O pacote iiufrgs pode ser obtido em <http://www.inf.ufrgs.br/utug>.

A versao mais atual do DeLaeTeX pode ser obtida em
<http://www.ece.ufrgs.br/~fetter/delaetex>.

POR FAVOR, NAO MODIFIQUE OS ARQUIVOS DO PACOTE DELAETEX. Modificar estes
arquivos nao e' a forma adequada para obter o efeito desejado. Certamente
existe uma forma de obter a formatacao desejada sem que seja necessario a
modificacao dos arquivo do pacote. Se o seu conhecimento de LaTeX nao e'
suficiente para saber como fazer isto, tambem nao e' suficiente para editar
corretamente os arquivos de estilo. Se for mesmo insistir em modificar os
arquivos, pelo menos altere os seus nomes.

Estao disponiveis as classes e estilos:
- delaetex.cls, para monografias. O tipo de monografia e' especificado atraves
de uma das opcoes:

	diss 			dissertacao de mestrado
	rp 			relatorio de pesquisa
	prop-tese 		proposta de tese de doutorado
	plano-doutorado 	plano curso de doutorado
	dipl-ele 		projeto de diplomacao em Engenharia Eletrica
	dipl-cca		projeto de diplomacao em Engenharia de Controle e Automacao
	dipl-ecp		projeto de diplomacao em Engenharia de Computacao
	dipl-ene		projeto de diplomacao em Engenharia de Energia
	estagio			relatório de estágio supervisionado 
	ti			trabalho individual
	pep			plano de estudos e pesquisa
	tese			tese de doutorado
	tc			trabalho de conclusao de mestrado profissional
	espec			monografia de conclusao de curso de especializacao

- delaeletter.cls, para produzir cartas com os brasoes da UFRGS e da Escola
de Engenharia.  Utilizando-se a opcao promo pode-se produzir cartas com o
logo da UFRGS ao inves do brasao.  Utilizando-se a opcao spf pode-se
produzir cartas padrao do Servico Publico Federal, com o Brasao de Armas da
Republica.

- ppgeesa.cls, para produzir artigos para o Seminario de Andamento do PPGEE.

- PPRdelaetex.sty, para gerar apresentacoes utilizando o pacote prosper.

- delaearticle.cls, para produzir documentos curtos como notas de aula,
roteiros de laboratorio, relatorios de afastamento etc.

-delaetplan.cls, para produzir documentos com o formato do plano de ensino.

E' importante notar que os tipos de monografia foram herdados do estilo do
II/UFRGS e DeLeTeX e nao necessariamente aplicam-se ao DELAE/EE/UFRGS ou ao
PPGEE/EE/UFRGS.  Ou seja, embora existam as opcoes pep e tc, isto nao
significa que um PEP seja exigido pelo PPGEE ou que exista um curso de
mestrado profissional no DELAE.

Arquivos de exemplo, estao no diretorio ``exemplos''.

Juntamente com o pacote DeLaeTeX recomenda-se a utilizacao dos pacotes:

- IEEEtran, versao 1.7, utilizado como base para a classe ppgeesa.cls. O IEEEtran pode
ser obtido em
<http://www.ctan.org/tex-archive/macros/latex/contrib/IEEEtran>. Se o seu
sistema tem uma versao anterior do IEEEtran, utilize uma versao do DeLeTeX
anterior a versao 1.3.0, ou atualize a versao do IEEEtran.

- IEEEtranBST, versao 1.12, utilizado para formatar as referencias
bibliograficas nos documentos no formato artigo para o Seminario de
Andamento do PPGEE. O IEEEtranBST pode ser obtido em
<http://www.ctan.org/tex-archive/macros/latex/contrib/IEEEtran/bibtex>. Se o
seu sistema tem uma versao anterior do IEEEtranBST, utilize uma versao do
DeLeTeX anterior a versao 1.3.0, ou atualize a versao do IEEEtranBST.

- prosper, utilizado gerar apresentacoes em pdf. Pode ser obtido em
<http://prosper.sourceforge.net>.


Para o pacote prosper funcionar adequadamente o arquivo .dvipsrc deve
existir no diretorio $HOME do usuario e conter as seguintes linhas:

p +psfonts.cmz 
p +psfonts.amz

Estas linhas forcam a utilizacao de fontes vetoriais e não bitmaps.

Adicionalmente a variavel de ambiente GS_OPTIONS deve estar adequadamente
configurada para que o ghostscript gere os arquivos no tamanho correto de
papel. Isto pode ser feito com os comandos:

export GS_OPTIONS="-sPAPERSIZE=a4"

se o seu shell e' o bash, ou

setenv GS_OPTIONS "-sPAPERSIZE=a4" 

se o seu shell e' o csh. Provavelmente o mais adequado e' que os comandos
acima sejam incluidos em algum script de incializacao: .bashrc, .profile,...


Para instalar o pacote DeLaeTeX existem os metodos faceis e os metodos
corretos.  Como quase sempre, os metodos faceis geralmente nao sao corretos
e os metodos corretos nem sempre sao os mais faceis.

METODO CORRETO 1: Requer privilegios de superusuario: 

digite 

make 

para compilar os exemplos, e

make install

para instalar o pacote no diretorio usual LaTeX: /usr/share/texmf.


METODO CORRETO 2: Requer privilegios de superusuario: 

digite

make 

para compilar os exemplos e 

make INSTALLDIR=/usr/local/texmf install

para instalar o pacote no diretorio /usr/local/texmf. A seguir digite

cd /usr/share/texmf/tex/latex

ou o diretorio que for apropriado, se o LaTeX estiver instalado em outro
lugar. E a seguir digite

ln -sf /usr/local/texmf/tex/latex/delaetex
mktexlsr

para incluir o DeLaeTeX no path default do LaTeX.

METODO CORRETO 3: Nao requer privilegios de superusuario: 

digite 

make

para compilar os exemplos, e

make INSTALLDIR=$HOME/texmf install

para instalar o pacote no diretorio texmf (ou escolha outro qualquer) dentro
do diretorio $HOME. A seguir, configure a variavel de ambiente TEXINPUTS.
Isto pode ser feito com os comandos:

export TEXINPUTS=$(TEXINPUTS):$(INSTALLDIR)/tex/latex/delaetex
se o seu shell e' o bash, substituindo $(INSTALLDIR) pelo diretorio
utilizado no comando make acima.

setenv TEXINPUTS $(TEXINPUTS):$(INSTALLDIR)/tex/latex/delaetex
se o seu shell e' o csh, substituindo $(INSTALLDIR) pelo diretorio
utilizado no comando make acima.

set TEXINPUTS=$TEXINPUTS;$INSTALLDIR/tex/latex/delaetex
no DOS/Windows, substituindo $INSTALLDIR pelo diretorio
utilizado no comando make acima.

Provavelmente o mais adequado e' que os comandos acima sejam incluidos em
algum script de incializacao: .bashrc, .profile, autoexec.bat,...


METODO QUICK & DIRTY: Nao requer privilegio de superusuario

Copie todos os arquivos do diretorio inputs para o diretorio onde esta' o
seu documento.
