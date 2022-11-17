package br.ifba.curso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/")
public class HomeController {
	
	@GetMapping("/")
	public String index() {
		System.out.println("HOME - index");
		return "index";
	}
	
	@GetMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	@PostMapping("/process_login")
	public String process_login(HttpServletRequest request, Model model) {
		String usuario = request.getParameter( "usuario" );
		String senha   = request.getParameter( "senha" );
		System.out.println("Usuario: " + usuario);
		System.out.println("Senha..: " + senha);
		
//		HttpSession session = request.getSession(); 
		return "dashboard";	
//		if ( senha.equals("12345678") ) {
//			model.addAttribute( "nome", usuario);
//			model.addAttribute( "descricao", "NADA");
//			session.setAttribute("nome", usuario);
//			return "dashboard";	
//		}
//		else {
//			model.addAttribute( "mensagem", "Senha Invalida");
//			return "erro";
//		}
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpServletRequest request, Model model) {
		return "dashboard";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@GetMapping("/cadastro_livro")
	public String cadastroLivro(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String usuario = (String) session.getAttribute("nome");
		System.out.println(usuario);
		return "cadastro_livro";
	}

}
