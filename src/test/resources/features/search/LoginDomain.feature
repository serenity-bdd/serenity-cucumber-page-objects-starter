Feature: Login to the application with domain

  #//////////////////////////////////////////////////////////////////////////////
  #basic scenarios

  Scenario Outline: Successful login
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "username_without_domain" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    Then check to "home page" has loaded
    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Failed login - Empty user
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "User is required"

    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Failed login - Incomplete domain
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "incomplete_username_without_domain" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Incorrect username_without_domain. Domain name must be compound of a Name + Dot + Domain Extension."

    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Failed login - Wrong name
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "jhon doe" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong username_without_domain Format. A Domain is required"

    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Failed login - Wrong name domain and wrong password
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "111" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Authentication rejected, contact with administrator"

    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |


  Scenario Outline: Failed login - Empty password
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Password is required"

    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Failed login - Empty password
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "username_without_domain" to element "username"
    And send credential "123456" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong user / password"

    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Ok/close error - Empty user
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "User is required"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                            | quit_error |
      | https://intaws.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intaws.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |

  Scenario Outline: Ok/close error - Incomplete domain
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "incomplete_username_without_domain" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Incorrect username. Domain name must be compound of a Name + Dot + Domain Extension."
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                            | quit_error |
      | https://intaws.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intaws.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |

  Scenario Outline: Ok/close error - Wrong name
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "jhon doe" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong username Format. A Domain is required"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                            | quit_error |
      | https://intaws.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intaws.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |

  Scenario Outline: Ok/close error - Wrong name domain and wrong password
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "111" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Authentication rejected, contact with administrator"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                            | quit_error |
      | https://intaws.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intaws.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |


  Scenario Outline: Ok/close error - Empty password
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Password is required"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                            | quit_error |
      | https://intaws.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intaws.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |

  Scenario Outline: Ok/close error - Empty password
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "username_without_domain" to element "username"
    And send credential "123456" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong user / password"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                            | quit_error |
      | https://intaws.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intaws.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |

  #//////////////////////////////////////////////////////////////////////////////
  # Field Validation Tests

  Scenario Outline: username_without_domain and Password Length
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "short_credential" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username_without_domain" to element "username"
    And send credential "short_credential" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "long_credential" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username_without_domain" to element "username"
    And send credential "long_credential" to element "password"
    And click in "validate"
    And click in "x"
    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Allowed Characters
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "character_error_credential" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username_without_domain" to element "username"
    And send credential "character_error_credential" to element "password"
    And click in "validate"
    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

  Scenario Outline: Spaced Blank User Pass
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "spaced_username_without_domain" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username_without_domain" to element "username"
    And send credential "spaced_password" to element "password"
    And click in "validate"
    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |
      | https://intdev.triskellsoftware.com/triskell/init/ |

#  Scenario Outline: SQL Injection
#    Given go to web "<webside>" with domain "domain"
#    Then check to "login" has loaded
#    When send credential "'admin' OR '1'='1'" to element "username"
#    And send credential "'password' OR '1'='1'" to element "password"
#    And click in "validate"
#    And click in "x"
#    And send credential "‘ or 1=1;–." to element "username"
#    And send credential "‘ or 1=1;–." to element "password"
#    And click in "validate"
#    Examples:
#      | webside                                                                 |
#      | https://intaws.triskellsoftware.com/triskell/init/                      |
#      | https://intdev.triskellsoftware.com/triskell/init/                      |
#      | https://intdev.triskellsoftware.com/triskell/init/                      |
#      | https://intaws.triskellsoftware.com/triskell/init/'admin' OR '1'='1'    |
#      | https://intdev.triskellsoftware.com/triskell/init/'admin' OR '1'='1'    |
#      | https://intdev.triskellsoftware.com/triskell/init/'admin' OR '1'='1'    |
#      | https://intaws.triskellsoftware.com/triskell/init/'password' OR '1'='1' |
#      | https://intdev.triskellsoftware.com/triskell/init/'password' OR '1'='1' |
#      | https://intdev.triskellsoftware.com/triskell/init/'password' OR '1'='1' |
#      | https://intaws.triskellsoftware.com/triskell/init/‘ or 1=1;–.           |
#      | https://intdev.triskellsoftware.com/triskell/init/‘ or 1=1;–.           |
#      | https://intdev.triskellsoftware.com/triskell/init/‘ or 1=1;–.           |

#  Scenario Outline: XSS Injection
#    Given go to web "<webside>" with domain "domain"
#    Then check to "login" has loaded
#    When send credential "<script>alert('XSS')</script>" to element "username"
#    And send credential "<script>alert('XSS')</script>" to element "password"
#    And click in "validate"
#    And click in "x"
#    And send credential "username_without_domain" to element "username"
#    And send credential "spaced_password" to element "password"
#    And click in "validate"
#    Examples:
#      | webside                                                                         |
#      | https://intaws.triskellsoftware.com/triskell/init/                              |
#      | https://intdev.triskellsoftware.com/triskell/init/                              |
#      | https://intdev.triskellsoftware.com/triskell/init/                              |
#      | https://intaws.triskellsoftware.com/triskell/init/<script>alert('XSS')</script> |
#      | https://intdev.triskellsoftware.com/triskell/init/<script>alert('XSS')</script> |
#      | https://intdev.triskellsoftware.com/triskell/init/<script>alert('XSS')</script> |

  Scenario Outline: Force Attack
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username_without_domain" to element "username"
    And send credential "spaced_password" to element "password"
    And click in "validate"
    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |
      | https://intaws.triskellsoftware.com/triskell/init/ |

  Scenario Outline: bad url
    Given go to web "<webside>" with domain "domain"
    Then check to "bad url" has loaded
    Examples:
      | webside                                             |
      | https://intawss.triskellsoftware.com/triskell/init/ |
      | https://intdevs.triskellsoftware.com/triskell/init/ |
      | https://intnrs.triskellsoftware.com/triskell/init/  |
      | https://intaws.triskellsoftwaree.com/triskell/init/ |
      | https://intdev.triskellsoftwaree.com/triskell/init/ |
      | https://intnr.triskellsoftwareee.com/triskell/init/ |
      | https://intaws.triskellsoftware.como/triskell/init/ |
      | https://intdev.triskellsoftware.como/triskell/init/ |
      | https://intnr.triskellsoftware.como/triskell/init/  |

  Scenario Outline: bad url folder
    Given go to web "<webside>" with domain "domain"
    Then check to "bad url folder" has loaded
    And click in "retry"
    Then check to "login" has loaded
    Examples:
      | webside                                            |
      | https://intaws.triskellsoftware.com/truskell/init/ |
      | https://intdev.triskellsoftware.com/truskell/init/ |
      | https://intnr.triskellsoftware.com/truskell/init/  |

    # ////////////////////////////////////////////////////////////
    # Especific domain test
  Scenario Outline: Ok/close error - Empty password
    Given go to web "<webside>" with domain "domain"
    Then check to "login" has loaded
    When send credential "username_without_domain" to element "username"
    And send credential "123456" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong user / password"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                            | quit_error |
      | https://intaws.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/init/ | ok         |
      | https://intaws.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |
      | https://intdev.triskellsoftware.com/triskell/init/ | x          |