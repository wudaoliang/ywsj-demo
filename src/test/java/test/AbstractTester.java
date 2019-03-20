package test;

import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author an
 * @date 2019/3/7 0007.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/applicationContext.xml"})
public abstract class AbstractTester {
    static final Logger LOGGER = Logger.getLogger(AbstractTester.class);

    /*static {
        try {
            Log4jConfigurer.initLogging("/log4j.properties");
        } catch (FileNotFoundException e) {
            LOGGER.error(e.getMessage());
            e.printStackTrace();
        }
    }*/
}

