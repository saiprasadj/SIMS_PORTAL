package com.sims.portal.masters.services;

import java.util.List;

import com.sims.portal.model.masters.beans.WareHouseMasterForm;

public interface WareHouseMasterService {

    void saveWareHouseMaster(WareHouseMasterForm wareHouseMasterForm);

    List<WareHouseMasterForm> findWareHouseMasterDetails();

    WareHouseMasterForm findWareHouseMasterDetailsByCode(String wareHouseMasterCode);

    void updateWareHouseMaster(WareHouseMasterForm wareHouseMasterForm);

    void deleteWareHouseMaster(WareHouseMasterForm wareHouseMasterForm);

}
