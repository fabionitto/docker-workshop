<!-- .slide: data-autoslide="10000" data-transition-speed="slow" -->

![Docker](images/docker.png) <!-- .element: height="240" align="left" style="border:none; background:none; box-shadow:none"--> 
![Kubernetes](images/kubernetes.png) <!-- .element: height="240" align="right" style="border:none; background:none; box-shadow:none"-->
# Docker + 
# Kubernetes 

--

<!-- .slide: data-state="auto-loop-prev" data-transition-speed="slow"-->

## O Poder dos contêineres na Infraestrutura
### Marcelo Linhares e Fábio Nitto

--------------------------------------------

DTI/MP
---

## Quem somos?

---

## Motivação

<br>
<br>

#### Implantação / Sustentação de Sistemas <!-- .element: class="fragment" data-fragment-index="1" -->

Note: Entrada no MP em 2010 - na infra 2014
- Explicar q a motivação veio na infra
- Tive contato com as dificuldades em instalar e implantar sistemas novos de acordo com a lista abaixo

--

### Dificuldades encontradas <!-- .slide: data-transition="fade" -->

- Diversidade de fontes externas fornecendo sistemas <!-- .element: class="fragment" data-fragment-index="1" -->
    - fábrica <!-- .element: class="fragment" data-fragment-index="2" -->
    - desenvolvimento interno <!-- .element: class="fragment" data-fragment-index="3" -->
    - demais áreas <!-- .element: class="fragment" data-fragment-index="4" -->
    - fábricas contratadas pelas áreas <!-- .element: class="fragment" data-fragment-index="5" -->

--

### Dificuldades encontradas <!-- .slide: data-transition="none" -->

- Ausência de Documentação (Implant/Sust) <!-- .element: class="fragment" data-fragment-index="1" -->
- Ausência de Padrões <!-- .element: class="fragment" data-fragment-index="2" -->
- Ausência de Configurações Apropriadas <!-- .element: class="fragment" data-fragment-index="3" -->
- Custo de sustentação (recursos humanos) <!-- .element: class="fragment" data-fragment-index="4" -->
- Alto risco ao migrar <!-- .element: class="fragment" data-fragment-index="5" -->

Note: Qual o workaround para os problemas acima?
Ministerio precisa ser adaptavel a solucoes diferentes
Legal vc conseguir usar um unico banco, mas nem sempre é possivel
O SEI, por ex, em php foi muito criticado por n ser java (mas resolve para o cidadão)

---

### Conteinerização / Orquestração
<br>

- Borg - Google <!-- .element: class="fragment" data-fragment-index="1" -->
- gmail, maps, search, docs, etc <!-- .element: class="fragment" data-fragment-index="1" -->
- de Borg para Kubernetes <!-- .element: class="fragment" data-fragment-index="2" -->

Note: - Convidamos vcs a entrarem nomundo dos conteineres e orquestr
- explicar diferença de orquestração x orq de contein
- os conteineres foram feitos para serem destruidos, eles n tem alma pois a alma esta nos dados persistidos

---

### Como está no MP

- começamos a estudar em 02/2016 <!-- .element: class="fragment" data-fragment-index="2" -->
- fase experimental (em produção) <!-- .element: class="fragment" data-fragment-index="3" -->
- AFD - Assentamento Funcional Digital <!-- .element: class="fragment" data-fragment-index="4" -->
- SEI - Sistema Eletrônico de Informações (desde 18/07) <!-- .element: class="fragment" data-fragment-index="5" -->
- Rancher - Nuvem <!-- .element: class="fragment" data-fragment-index="6" -->

---

<!-- .slide: data-background-image="none" -->
![Docker](images/seinumeros.png) <!-- .element: height="700" style="border:none; background:none; box-shadow:none"-->

---

<!-- .slide: data-background-image="none" data-transition="fade" -->
![Docker](images/seikubenumeros1.png) <!-- .element: height="600" -->

---

<!-- .slide: data-background-image="none" data-transition="fade" -->
![Docker](images/seikubenumeros2.png) <!-- .element: height="600" -->

---
## O que é Contêiner?

- Conceito similar ao de Máquina Virtual.
- Virtualização a nível de SO.

--

> Formalmente, é um processo ou grupo de processos que executam de forma isolada:

- Processo (PID)
- Usuários
- Rede
- Recursos (CPU, RAM, Disco)
- Estrutura de diretórios
- Bibliotecas

Note: Na prática, o processo "enxerga" apenas seu grupo de processos, seus próprios usuários. Sua própria rede, recursos e estrutura de diretórios. O processo "acha" que só existe ele e seu grupo rodando na máquina.

A diferença para VM é que não existe o SO.

Notem que a VM possui todo esse isolamento, mas é um sistema completo. O conteinr é apenas um processo ou grupo de processos.
--

- Implementado com LXC (Linux Containers - 2008)
- Interface direto com o Kernel do linux: <!-- .element: class="fragment" data-fragment-index="0" --> 
  - Namespaces <!-- .element: class="fragment" data-fragment-index="1" -->
  - Cgroups <!-- .element: class="fragment" data-fragment-index="1" -->
  - Capabilities <!-- .element: class="fragment" data-fragment-index="1" -->
  - APParmor e SELinux <!-- .element: class="fragment" data-fragment-index="1" -->
  - Seccomp Policies <!-- .element: class="fragment" data-fragment-index="1" -->
  - Chroots <!-- .element: class="fragment" data-fragment-index="1" -->

Note: 
Namespaces - isolamento de PID(processo), mounts, rede, ipc(ex. fifos, semaforos, memoria compartilhada), UTS (hostnames e domainname), Usuarios

cgroups - isolamento de recursos - CPU, memoria, disco, rede

APParmor e SELinux - Controle de acesso a escrita e modificação de arquivos, principalmente /proc

Capabilities: Controle sobre as capacidades do usuario root (UID 0), ex. 

Seccomp - Controle sobre chamadas de sistema 

chroot - altera o diretorio root do sistema/conteiner

---

##  Interface direto com o Kernel?
## Parece dificil...

--

### Docker simplifica o uso:

![Interface](images/dockerTogether.png) <!-- .element: height="700" style="border:none; background:none; box-shadow:none" -->

---

## Máquina Física
![Docker](images/maquinaFisica.png) <!-- .element: align="left" width="500" style="border:none; background:none; box-shadow:none" -->

- Deployment lento		<!-- .element: class="fragment" data-fragment-index="1" -->
- Alto custo			<!-- .element: class="fragment" data-fragment-index="1" -->
- Desperdicio de recursos	<!-- .element: class="fragment" data-fragment-index="1" -->
- Dificuldade de escalar	<!-- .element: class="fragment" data-fragment-index="1" -->
- Dificuldade de migração	<!-- .element: class="fragment" data-fragment-index="1" -->
<!-- - Vendor Lock-in -->

--
## Virtualizadora
<!-- .slide: data-transition="none slide-out" --> 
![Docker](images/hypervisor.png) <!-- .element: align="left" width="450" style="border:none; background:none; box-shadow:none" --> 

#### Ganhos

- Pool de recursos		<!-- .element: class="fragment" data-fragment-index="1" -->
- Maior facilidade de escala	<!-- .element: class="fragment" data-fragment-index="1" -->
- VMs na nuvem			<!-- .element: class="fragment" data-fragment-index="1" -->
  - Elasticidade		<!-- .element: class="fragment" data-fragment-index="1" -->
  - Pay as you go		<!-- .element: class="fragment" data-fragment-index="1" -->

--

## Virtualizadora
<!-- .slide: data-transition="none" --> 
![Docker](images/hypervisor.png) <!-- .element: align="left" width="450" style="border:none; background:none; box-shadow:none" --> 

#### Dificuldades

- Alocação de recursos <br> 
  ainda necessária		<!-- .element: class="fragment" data-fragment-index="1" -->
- SO guest necessário				<!-- .element: class="fragment" data-fragment-index="1" -->
  - recursos desperdiçados			<!-- .element: class="fragment" data-fragment-index="1" -->
- Portabilidade não garantida			<!-- .element: class="fragment" data-fragment-index="1" -->

--
## Contêineres
![Docker](images/container.png) <!-- .element: align="left" width="400" style="border:none; background:none; box-shadow:none" --> 

- Mais leves (tamanho)			<!-- .element: class="fragment" data-fragment-index="1" -->
- Sem SO guest necessário		<!-- .element: class="fragment" data-fragment-index="1" -->
- Menos recursos necessarios<br>
  (CPU,RAM,Storage) 			<!-- .element: class="fragment" data-fragment-index="1" -->
  - Mais containers por host		<!-- .element: class="fragment" data-fragment-index="1" -->

Note: Maior portabilidade pois abstrai a rede, filesystem e outros recursos.

--

## Docker Engine
![Docker](images/dockerArch.png) <!-- .element: align="left" width="400" style="border:none; background:none; box-shadow:none" class="fragment" data-fragment-index="0" --> 

- API	<!-- .element: class="fragment" data-fragment-index="1" -->
- Empacotamento <!-- .element: class="fragment" data-fragment-index="1" -->     
- DevOps (Separação de Funções)	<!-- .element: class="fragment" data-fragment-index="1" -->                                                                                  
- Densidade <!-- .element: class="fragment" data-fragment-index="1" -->
- Maior portabilidade <!-- .element: class="fragment" data-fragment-index="1" -->	

Note: 
API - para criar, gerenciar destruir imagens e conteineres
Empacotamento - 
DevOps - Imagem desenvolvida por DEV. Infra apenas roda o conteiner, disponibilizando a infra de LB, storage, cluster. 

---

<!-- .slide: data-transition="fade" -->
## Conceitos Básicos de Docker

### Conceitos:

- Conteiner
- Imagem
- Registry

--

<!-- .slide: data-transition="fade" -->
## Conceitos Básicos de Docker

### Comandos:

```
$ docker run
$ docker pull
$ docker build
$ docker stop
```

---

## Componentes docker
![Docker](images/componentes1.png) <!-- .slide: data-transition="fade-out" -->
--
## Docker run
![Docker](images/componentes2.png) <!-- .slide: data-transition="fade" -->
--
## Docker run
![Docker](images/componentes3.png) <!-- .slide: data-transition="fade" -->
--
## Docker run
![Docker](images/componentes4.png) <!-- .slide: data-transition="fade" -->
--
## Docker run
![Docker](images/componentes5.png) <!-- .slide: data-transition="fade" -->
--
## Docker pull 
![Docker](images/componentes6.png) <!-- .slide: data-transition="fade" -->
--
## Docker pull
![Docker](images/componentes7.png) <!-- .slide: data-transition="fade" -->
--
## Docker build
![Docker](images/componentes8.png) <!-- .slide: data-transition="fade" -->
--

Demo

Note:
% startar servico docker (docker-engine x docker-machine)
% docker images
% docker run -it --rm centos:6.7 /bin/bash
% cat /etc/*release*
% ps aux hostname ifconfig
% yum install -y vim
# alusao a invasao hacker, comportamento inadequado de aplicacao nova, etc
% rm -rf /usr/bin /usr/sbin /bin /sbin /lib
% exit
% docker run -it --rm centos:6.7 /bin/bash
 
# owncloud
% docker run -d --name o1 -p 8080:80 owncloud:8
% docker run -d --name o2 -p 8081:80 owncloud:8
# Notem a facilidade de instalação e uso. Quase um gerenciador de pacotes: apt, yum. Se integra facilmente com a idéia de SaaS.
# Muito bom para implementar ambientes de testes, cursos, poc etc.
 
---

## Docker Compose

- Ambientes multi-conteiner
- Deploy mais fácil:
  - docker-compose up
  - docker-compose stop

- Escalabilidade

Note: Exemplo SEI: versão 1 da api.
	Docker compose já está na versão 2 da API, contemplando volumes e networks.
---

## Provisionamento, Deployment e Configuração

**2 Visões:**

<ol>
<li> 
<table style="border: 1px solid black">
  <tr style="border: 1px solid black">
    <th colspan="2" style="border: 1px solid black; text-align: center"> Deployment </th>
  </tr>
  <tr>
    <td style="border: 1px solid black"> Provisionamento </td>
    <td> Configuração </td>
  </tr>
</table>
</li>

<li>
<table style="border: 1px solid black">
  <tr style="border: 1px solid black">
    <th style="border: 1px solid black; text-align: center"> Deployment </th>
    <th style="border: 1px solid black"> Provisionamento </th>
    <th> Configuração </th>
  </tr>
</table>
</li>
</ol>
--

- **Provisionamento:** Preparar a maquina/host/cluster com sistema e bibliotecas
- **Deployment:** Entregar a aplicação
- **Configuração:** Configurar a aplicação

--

Ferramentas como:
- Puppet
- Chef
- Ansible
- Salt

Atuam, de formas diversas, em toda a linha de produção, buscando a automatização das tarefas de provisionamento, deployment e configuração.

Docker não as substituem, mas as complementam.


Note: O que foi visto sobre docker, basicamente se encaixa na visão de deployment de aplicações.

--

Demo

---

## Orquestração
Note: Orquestração de Conteineres

--

## Por que cluster e orquestração?

- Docker compose em apenas um host
- Alta disponibilidade
- Resiliência
- Escalabilidade automática
- Deploy e rollback imediato e sem indisponibilidade

--

## Opções

- Kubernetes
- Docker Swarm
- Apache Mesos
- Nomad

---

## Kubernetes

![Docker](images/kubernetes_archi01.png) <!-- .slide: data-transition="fade-out" -->

--

![Docker](images/kubernetes_archi02.png) <!-- .slide: data-transition="fade-out" -->

--

![Docker](images/kubernetes_archi03.png) <!-- .slide: data-transition="fade-out" -->

---

![Docker](images/kubernetes_example1_01.png) <!-- .slide: data-transition="fade-out" -->

--

![Docker](images/kubernetes_example1_02.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_03.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_04.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_05.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_06.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_07.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_08.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_09.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_10.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_11.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_12.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_13.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_14.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_15.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_16.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_17.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_18.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_19.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_20.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_21.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_22.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_23.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_24.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_25.png) <!-- .slide: data-transition="none" -->

--

![Docker](images/kubernetes_example1_26.png) <!-- .slide: data-transition="none" -->

---

Demo

---

# Obrigado!

> **fabio.nitto**@planejamento.gov.br
> **marcelo.linhares**@planejamento.gov.br
