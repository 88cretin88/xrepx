package com.baisalbek.pswds.controller;

import com.baisalbek.pswds.entities.Item;
import com.baisalbek.pswds.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @GetMapping("/index")
    public String items(Model model) {
        List<Item> items = itemService.getAllItems();
        model.addAttribute("items", items);
        model.addAttribute("item", new Item());
        model.addAttribute("title", "All items | PSWDS");
        model.addAttribute("isAdd", true);
        return "index";
    }

    @PostMapping(value = "/save")
    public String save(@ModelAttribute Item item, RedirectAttributes redirectAttributes, Model model) {
        Item dbItem = itemService.save(item);
        if (dbItem != null) {
            redirectAttributes.addFlashAttribute("successmessage", "Item is saved successfully!");
            return "redirect:/index";

//            return "redirect:/";

        } else {
            model.addAttribute("errormessage", "Item is not saved, Please try again!");
            model.addAttribute("item", item);
            return "index";
        }
    }

    @GetMapping(value = "/getItem/{id}")
    public String getItem(@PathVariable long id, Model model) {
        Item item = itemService.findById(id);
        List<Item> items = itemService.getAllItems();
        model.addAttribute("items", items);
        model.addAttribute("item", item);
        model.addAttribute("title", "Edit | PSWDS");
        model.addAttribute("isAdd", false);
        return "index";
    }

    @PostMapping(value = "/update")
    public String update(@ModelAttribute Item item, RedirectAttributes redirectAttributes, Model model) {
        Item dbItem = itemService.update(item);
        if (dbItem != null) {
            redirectAttributes.addFlashAttribute("successmessage", "Item is updated successfully!");
            return "redirect:/index";

//            return "redirect:/";

        } else {
            model.addAttribute("errormessage", "Item is not updated, Please try again!");
            model.addAttribute("item", item);
            return "index";
        }
    }

    @GetMapping("/deleteItem/{id}")
    public String deleteItem(@PathVariable long id,RedirectAttributes redirectAttributes) {
        itemService.delete(id);
        redirectAttributes.addFlashAttribute("successmessage", "Item is deleted successfully!");
        return "redirect:/index";

//        return "redirect:/";
    }
}
