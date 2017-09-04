package com.peregrineairlines.services;

import com.peregrineairlines.entities.PlaneModel;
import com.peregrineairlines.repositories.PlaneModelRepository;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Chris
 */
public class PlaneModelServiceImpl implements PlaneModelService {
    
    @Autowired
    private PlaneModelRepository planeModelRepository;

    @Override
    public Collection<PlaneModel> getPlaneModels() {
        return planeModelRepository.findAll();
    }

    @Override
    public PlaneModel getPlaneModelById(int planeModelId) {
        return planeModelRepository.findById(planeModelId);
    }

}
