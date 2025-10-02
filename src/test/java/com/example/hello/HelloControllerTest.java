package com.example.hello;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;

public class HelloControllerTest {
    @Test
    void testHelloMessage() {
        HelloController controller = new HelloController();
        assertThat(controller.hello()).isEqualTo("Hello, Azure DevOps CI/CD!");
    }
}
