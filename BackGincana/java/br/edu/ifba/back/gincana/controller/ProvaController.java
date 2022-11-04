package br.edu.ifba.back.gincana.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.edu.ifba.back.gincana.model.ProvaModel;
import br.edu.ifba.back.gincana.repository.ProvaRepository;

@RestController
@RequestMapping("/provas")
public class ProvaController {
	
	@Autowired
	private ProvaRepository repository;
	
	@GetMapping("/listall")
	public List<ProvaModel> listall() {
		List<ProvaModel> result = repository.findAll();
		return result;
	}
	
	@GetMapping(value = "/{id}")
    public ProvaModel findById(@PathVariable Long id) {
		Optional<ProvaModel> obj = repository.findById(id);
		if ( obj.isPresent() )
			return obj.get();
        return null;
    }
	
	@PostMapping
	public ProvaModel insert (@RequestBody ProvaModel prova) {
		ProvaModel result = repository.save(prova);
		return result;
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<ProvaModel> delete(@PathVariable Long id) {
		repository.deleteById(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<ProvaModel> update(@PathVariable Long id, @RequestBody ProvaModel provaModel) {
		var p = repository.findById(id);
        if (p.isPresent()) {
            var prova = p.get();
            
            if (provaModel.getNome_Prova() != null)
            	prova.setNome_Prova(provaModel.getNome_Prova());
            
            if (provaModel.getDescricao_Prova() != null)
            	prova.setDescricao_Prova(provaModel.getDescricao_Prova());
            
            if (provaModel.getData_Prova() != null)
            	prova.setData_Prova(provaModel.getData_Prova());
            
            if (provaModel.getHorario_Prova() != null )
            	prova.setHorario_Prova(provaModel.getHorario_Prova());
            
            /*if (provaModel.getAgenda() != null)
            	prova.setAgenda(provaModel.getAgenda());*/
            
            repository.save(prova);
            return ResponseEntity.ok(prova);
        } else {
        	return ResponseEntity.notFound().build();
        }
	}
}