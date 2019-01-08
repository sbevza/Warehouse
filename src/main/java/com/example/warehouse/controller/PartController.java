package com.example.warehouse.controller;

import com.example.warehouse.model.Part;
import com.example.warehouse.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class PartController {
    private PartService partService;

    @Autowired(required = true)
    @Qualifier(value = "partService")
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = "/")
    public String index(@RequestParam(value = "page", required = false) String page,
                        @RequestParam(value = "sorting", required = false) boolean sorting,
                        Model model) {

        int maxResults = 10;

        int currentPage = (page == null) ? 1 : Integer.parseInt(page);
        model.addAttribute("part", new Part());
        if (sorting) {
            model.addAttribute("parts", partService.getRequireParts());
            model.addAttribute("pageAmount", 1);
            model.addAttribute("currentPage", 1);
        } else {
            model.addAttribute("parts", partService.getPaginatedParts(currentPage, maxResults));
            int pageAmount = (int) Math.ceil(1.0 * partService.getPositionsQuantity() / maxResults);
            model.addAttribute("pageAmount", pageAmount);
            model.addAttribute("currentPage", currentPage);
        }

        model.addAttribute("canAssemble", partService.canAssembleAmount());

        String checked = (sorting ? "checked" : "");
        model.addAttribute("sorting", checked);

        return "WEB-INF/views/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("part") Part part,
                          @RequestParam(value = "page", required = false) String page) {

        int currentPage = (page == null) ? 1 : Integer.parseInt(page.trim());
        if (part.getId() == 0) {
            partService.addPart(part);
        } else {
            partService.updatePart(part);
        }

        return "redirect:/" + (currentPage > 1 ? "?page=" + currentPage : "");
    }

    @RequestMapping(value = "/search")
    public Model SearchByName(@RequestParam(value = "searchString", required = false) String searchString, Model model) {
        model.addAttribute("part", new Part());
        model.addAttribute("parts", partService.findAllPartsByName(searchString));
        model.addAttribute("searchString", searchString);
        return model;
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("part", partService.getPartById(id));
        model.addAttribute("parts", partService.getAllParts());

        return "WEB-INF/views/edit";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        partService.removePart(id);

        return "redirect:/";
    }
}
