package br.ifba.curso.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.ifba.curso.model.CursoModel;
import br.ifba.curso.service.CursoService;

@Controller
@RequestMapping("/curso")
public class CursoController {
	@Autowired
	private CursoService cursoService;
	
	@GetMapping("/")
	public String index(Model model) {
		System.out.println("tarefas_lista - init");
		List<CursoModel> list = this.cursoService.getCursos();
		model.addAttribute("tarefas", list);
		return "curso/index";
	}

	@GetMapping("/adicionar_form")
	public String adicionar_form() {
		return "curso/adicionar_form";
	}
	
	@PostMapping("/adicionar")
	public String adicionar(@ModelAttribute CursoModel cursoModel, Model model) {
		System.out.println("insert: " + cursoModel.getNome_Curso());
		CursoModel tm = new CursoModel();
		tm.setModalidade_Curso(cursoModel.getModalidade_Curso());
		tm.setNome_Curso(cursoModel.getNome_Curso());
		cursoService.insert(tm);
		return "redirect:/curso/";
	}
	
	@RequestMapping(value="/deletar/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable("id") Integer id) {
		Boolean boo = this.cursoService.deleteCurso(id);
		return "redirect:/curso/";
	}
	
	@GetMapping("/editar_form/{id}")
	public String editar_form(@PathVariable("id") Integer id, Model model) {
		CursoModel tm = this.cursoService.getCurso(id);
		model.addAttribute("id_Curso", tm.getId_Curso());
		model.addAttribute("nome_Curso", tm.getNome_Curso());
		model.addAttribute("modalidade_Curso", tm.getModalidade_Curso());
		return "curso/editar_form";
	}
	
	@PostMapping("/editar")
	public String editar(@ModelAttribute CursoModel cursoModel, Model model) {
		CursoModel tm = this.cursoService.getCurso(cursoModel.getId_Curso());
		tm.setNome_Curso(cursoModel.getNome_Curso());
		cursoService.update(tm);
		return "redirect:/curso/";
	}
}