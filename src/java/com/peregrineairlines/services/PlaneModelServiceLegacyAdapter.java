package com.peregrineairlines.services;

import com.peregrineairlines.entities.PlaneModel;
import com.peregrineairlines.model.PAModel;
import java.util.Collection;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris
 */
@Service
public class PlaneModelServiceLegacyAdapter implements PlaneModelService {

    @Override
    public Collection<PlaneModel> getPlaneModels() {
        return PAModel.getPlaneModels();
    }

    @Override
    public PlaneModel getPlaneModelById(int planeModelId) {
        return PAModel.getPlaneModelById(planeModelId);
    }

}
