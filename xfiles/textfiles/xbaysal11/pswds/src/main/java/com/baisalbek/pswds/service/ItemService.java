package com.baisalbek.pswds.service;


import com.baisalbek.pswds.entities.Item;

import java.util.List;

public interface ItemService {
    List<Item> getAllItems();
    Item save(Item item);
    Item findById(long id);
    Item update(Item item);
    void delete(long id);
}
