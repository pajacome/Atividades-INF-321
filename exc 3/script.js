// CSS mínimo das classes usadas pelo JS
const estilo = document.createElement("style");
estilo.textContent = `
  .oculto { display: none !important; }
  .msg { background: #d1fae5; border: 1px solid #10b981; padding: 10px; margin: 10px 30px; border-radius: 6px; }
  .btn-comprar { padding: 10px 20px; margin: 10px 0; border: none; border-radius: 6px; background: #2563eb; color: white; cursor: pointer; }
  .btn-comprar.comprado { background: #16a34a; }
  .erro { border: 2px solid red; }
  .msg-erro { color: red; font-size: 12px; display: block; }
  #busca { margin: 10px 30px; }
  #busca input { padding: 8px; }
  #busca button { padding: 8px 14px; }
  .contato label, .contato input, .contato textarea { display: block; margin-top: 8px; }
`;
document.head.appendChild(estilo);

const produtos = document.querySelectorAll("#produtos article");

// 2. Campo de busca (filtra a lista ao clicar em Buscar)
const busca = document.createElement("div");
busca.id = "busca";
busca.innerHTML = `<input type="text" id="campoBusca" placeholder="Digite um produto..."> <button id="btnBuscar">Buscar</button>`;
document.getElementById("produtos").before(busca);

document.getElementById("btnBuscar").addEventListener("click", () => {
  const termo = document.getElementById("campoBusca").value.toLowerCase();
  produtos.forEach((p) => {
    const nome = p.querySelector("h3").textContent.toLowerCase();
    if (nome.includes(termo)) p.classList.remove("oculto");
    else p.classList.add("oculto");
  });
});

// 1. Botão "Comprar" (mostra mensagem)
const msg = document.createElement("div");
msg.className = "msg oculto";
msg.textContent = "Produto adicionado ao carrinho!";
document.getElementById("produtos").before(msg);

let timer;
produtos.forEach((p) => {
  const btn = document.createElement("button");
  btn.className = "btn-comprar";
  btn.textContent = "Comprar";
  p.appendChild(btn);

  btn.addEventListener("click", () => {
    btn.classList.toggle("comprado"); // 4. interação visual com classList
    msg.classList.remove("oculto");
    clearTimeout(timer);
    timer = setTimeout(() => msg.classList.add("oculto"), 2000);
  });
});

// 3. Formulário com validação (Nome, E-mail, Mensagem)
const contato = document.createElement("div");
contato.className = "card";
contato.innerHTML = `
  <section class="cadastro contato">
    <h2>Fale Conosco</h2>
    <form id="formContato" novalidate>
      <label>Nome *</label>
      <input type="text" id="nome">
      <span class="msg-erro oculto">Este campo é obrigatório.</span>

      <label>E-mail *</label>
      <input type="email" id="email">
      <span class="msg-erro oculto">Este campo é obrigatório.</span>

      <label>Mensagem *</label>
      <textarea id="mensagem" rows="4"></textarea>
      <span class="msg-erro oculto">Este campo é obrigatório.</span>

      <div id="cadastroBotao"><button type="submit">Enviar Mensagem</button></div>
    </form>
  </section>`;
document.querySelector("footer").before(contato);

document.getElementById("formContato").addEventListener("submit", (e) => {
  e.preventDefault();
  let valido = true;

  ["nome", "email", "mensagem"].forEach((id) => {
    const campo = document.getElementById(id);
    const aviso = campo.nextElementSibling;
    if (campo.value.trim() === "") {
      campo.classList.add("erro");
      aviso.classList.remove("oculto");
      valido = false;
    } else {
      campo.classList.remove("erro");
      aviso.classList.add("oculto");
    }
  });

  if (valido) {
    alert("Mensagem enviada!");
    e.target.reset();
  }
});