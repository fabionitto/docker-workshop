
# ![Docker](images/docker.png) <!-- .element: width="250" height="250" style="border:none; background:none; box-shadow:none"--> Docker + ![Kubernetes](images/kubernetes.png) <!-- .element: width="200" height="200" style="border:none; background:none; box-shadow:none"--> Kubernetes

--

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

---

### Dificuldades encontradas 

- Diversidade de fontes externas fornecendo sistemas <!-- .element: class="fragment" data-fragment-index="1" -->
    - fábrica <!-- .element: class="fragment" data-fragment-index="2" -->
    - desenvolvimento interno <!-- .element: class="fragment" data-fragment-index="3" -->
    - demais áreas <!-- .element: class="fragment" data-fragment-index="4" -->
    - fábricas contratadas pelas áreas <!-- .element: class="fragment" data-fragment-index="5" -->

---

### Dificuldades encontradas 

- Ausência de Documentação (Implant/Sust) <!-- .element: class="fragment" data-fragment-index="1" -->
- Ausência de Padrões <!-- .element: class="fragment" data-fragment-index="2" -->
- Ausência de Configurações Apropriadas <!-- .element: class="fragment" data-fragment-index="3" -->
- Custo de sustentação (recursos humanos) <!-- .element: class="fragment" data-fragment-index="4" -->
- Alto risco ao migrar <!-- .element: class="fragment" data-fragment-index="5" -->


---

### Conteinerização / Orquestração
<br>

- Borg - Google <!-- .element: class="fragment" data-fragment-index="1" -->
- gmail, maps, search, docs, etc <!-- .element: class="fragment" data-fragment-index="1" -->
- de Borg para Kubernetes <!-- .element: class="fragment" data-fragment-index="2" -->

---

### Como está no MP

- começamos a estudar em 02/2016 <!-- .element: class="fragment" data-fragment-index="2" -->
- fase experimental (em produção) <!-- .element: class="fragment" data-fragment-index="3" -->
- AFD - Assentamento Funcional Digital <!-- .element: class="fragment" data-fragment-index="4" -->
- SEI - Sistema Eletrônico de Informações (desde 18/07) <!-- .element: class="fragment" data-fragment-index="5" -->
- Rancher - Nuvem <!-- .element: class="fragment" data-fragment-index="6" -->

---
## O que é Contêiner?

Área isolada de processamento com separação entre processos.

- Implementado com LXC (Linux Containers) - 2008  
  - Virtualização a nível de SO.

--

- Funcionalidades de virtualização no Kernel do linux:
  - Namespaces <!-- .element: class="fragment" data-fragment-index="3" -->
  - Cgroups <!-- .element: class="fragment" data-fragment-index="4" -->
  - Capabilities <!-- .element: class="fragment" data-fragment-index="5" -->
  - APParmor e SELinux <!-- .element: class="fragment" data-fragment-index="6" -->
  - Seccomp Policies <!-- .element: class="fragment" data-fragment-index="7" -->
  - Chroots <!-- .element: class="fragment" data-fragment-index="8" -->

Note: 
Namespaces - isolamento de PID(processo), mounts, rede, ipc(ex. fifos, semaforos, memoria compartilhada), UTS (hostnames e domainname), Usuarios

cgroups - isolamento de recursos - CPU, memoria, disco, rede

APParmor e SELinux - Controle de acesso a escrita e modificação de arquivos, principalmente /proc

Capabilities: Controle sobre as capacidades do usuario root (UID 0), ex. 

Seccomp - Controle sobre chamadas de sistema 

chroot - altera o diretorio root do sistema/conteiner

---
## Porque contêineres?

## Máquina Física
![Docker](images/maquinaFisica.png) <!-- .slide: data-transition="fade-out" -->

- Deployment lento
- Alto custo
- Disperdicio de recursos
- Dificuldade de escalar
- Dificuldade de migração
- Vendor Lock-in

--
## Hypervisor
![Docker](images/hypervisor.png) <!-- .slide: data-transition="fade" -->

- Pool de recursos
- Maior facilidade de escala
- VMs na nuvem
  - Elasticidade
  - Pay as you go

- Alocação de recursos ainda necessária
- OS guest necessário
  - recursos disperdiçados
- Portabilidade não garantida

--
## Contêineres
![Docker](images/container.png) <!-- .slide: data-transition="fade" -->

- Mais leves (tamanho)
- Sem OS guest necessário
- Menos recursos necessarios (CPU,RAM,Storage)
  - Mais containers por host do que VMs
- Maior portabilidade


---

## VM's vs Contêineres

---

# Docker

--

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

---

# Provisionamento

---

# Docker-compose

--

Demo

---

# Orquestração

## Por que cluster e orquestração?

- Alta disponibilidade
- Resiliência
- Escalabilidade automática
- Deploy e rollback imediato e sem indisponibilidade

---

# Kubernetes

--

Demo

---

# Obrigado!


- Fábio Nitto 		 
  - fabio.nitto@planejamento.gov.br
----  
- Marcelo Linhares
  - marcelo.linhares@planejamento.gov.br
