package com.peregrineairlines.context;

import com.peregrineairlines.model.PAModel;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author Chris
 */
public class Listener implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        PAModel.open();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        PAModel.close();
    }
    
}
