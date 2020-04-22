package com.baisalbek.pswds.service.impl;

import com.baisalbek.pswds.entities.Item;
import com.baisalbek.pswds.repository.ItemRepository;
import com.baisalbek.pswds.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemRepository itemRepository;

    @Override
    public List<Item> getAllItems() {
        return (List<Item>) itemRepository.findAll();
    }

    @Override
    public Item save(Item item) {
        item.setCreateDate(new Date());
        return itemRepository.save(item);
    }

    @Override
    public Item findById(long id) {
        Optional<Item> item = itemRepository.findById(id);
        if (item.isPresent()){
            return item.get();
        }else{
            return null;
        }
    }

    @Override
    public Item update(Item item) {
        item.setUpdateDate(new Date());
        return itemRepository.save(item);
    }

    @Override
    public void delete(long id) {
        itemRepository.deleteById(id);
    }
}
