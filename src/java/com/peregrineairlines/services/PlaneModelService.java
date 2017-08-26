package com.peregrineairlines.services;

import com.peregrineairlines.entities.PlaneModel;
import java.util.Collection;

/**
 *
 * @author Chris
 */
public interface PlaneModelService {

    public Collection<PlaneModel> getPlaneModels();
    public PlaneModel getPlaneModelById(int planeModelId);
}
