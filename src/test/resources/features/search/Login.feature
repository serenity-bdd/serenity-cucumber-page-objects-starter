Feature: Login to the application

  #//////////////////////////////////////////////////////////////////////////////
  #basic scenarios

  Scenario Outline: Successful login
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "username" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    Then check to "home page" has loaded
    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Failed login - Empty user
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "User is required"

    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Failed login - Incomplete domain
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "incomplete_username" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Incorrect Username. Domain name must be compound of a Name + Dot + Domain Extension."

    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Failed login - Wrong name
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "jhon doe" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong Username Format. A Domain is required"

    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Failed login - Wrong name domain and wrong password
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "111" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Authentication rejected, contact with administrator"

    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |


  Scenario Outline: Failed login - Empty password
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Password is required"

    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Failed login - Empty password
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "username" to element "username"
    And send credential "123456" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong user / password"

    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Ok/close error - Empty user
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "User is required"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                       | quit_error |
      | https://intaws.triskellsoftware.com/triskell/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/ | ok         |
      | https://intnr.triskellsoftware.com/triskell/  | ok         |
      | https://intaws.triskellsoftware.com/triskell/ | x          |
      | https://intdev.triskellsoftware.com/triskell/ | x          |
      | https://intnr.triskellsoftware.com/triskell/  | x          |

  Scenario Outline: Ok/close error - Incomplete domain
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "incomplete_username" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Incorrect Username. Domain name must be compound of a Name + Dot + Domain Extension."
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                       | quit_error |
      | https://intaws.triskellsoftware.com/triskell/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/ | ok         |
      | https://intnr.triskellsoftware.com/triskell/  | ok         |
      | https://intaws.triskellsoftware.com/triskell/ | x          |
      | https://intdev.triskellsoftware.com/triskell/ | x          |
      | https://intnr.triskellsoftware.com/triskell/  | x          |

  Scenario Outline: Ok/close error - Wrong name
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "jhon doe" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong Username Format. A Domain is required"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                       | quit_error |
      | https://intaws.triskellsoftware.com/triskell/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/ | ok         |
      | https://intnr.triskellsoftware.com/triskell/  | ok         |
      | https://intaws.triskellsoftware.com/triskell/ | x          |
      | https://intdev.triskellsoftware.com/triskell/ | x          |
      | https://intnr.triskellsoftware.com/triskell/  | x          |

  Scenario Outline: Ok/close error - Wrong name domain and wrong password
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "111" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Authentication rejected, contact with administrator"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                       | quit_error |
      | https://intaws.triskellsoftware.com/triskell/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/ | ok         |
      | https://intnr.triskellsoftware.com/triskell/  | ok         |
      | https://intaws.triskellsoftware.com/triskell/ | x          |
      | https://intdev.triskellsoftware.com/triskell/ | x          |
      | https://intnr.triskellsoftware.com/triskell/  | x          |


  Scenario Outline: Ok/close error - Empty password
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "1@1.1" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Password is required"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                       | quit_error |
      | https://intaws.triskellsoftware.com/triskell/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/ | ok         |
      | https://intnr.triskellsoftware.com/triskell/  | ok         |
      | https://intaws.triskellsoftware.com/triskell/ | x          |
      | https://intdev.triskellsoftware.com/triskell/ | x          |
      | https://intnr.triskellsoftware.com/triskell/  | x          |

  Scenario Outline: Ok/close error - Empty password
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "username" to element "username"
    And send credential "123456" to element "password"
    And click in "validate"
    Then verify the text element "error" is "Wrong user / password"
    And click in "<quit_error>"
    Then check to "login" has loaded

    Examples:
      | webside                                       | quit_error |
      | https://intaws.triskellsoftware.com/triskell/ | ok         |
      | https://intdev.triskellsoftware.com/triskell/ | ok         |
      | https://intnr.triskellsoftware.com/triskell/  | ok         |
      | https://intaws.triskellsoftware.com/triskell/ | x          |
      | https://intdev.triskellsoftware.com/triskell/ | x          |
      | https://intnr.triskellsoftware.com/triskell/  | x          |

  #//////////////////////////////////////////////////////////////////////////////
  # Field Validation Tests

  Scenario Outline: Username and Password Length
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "short_credential" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username" to element "username"
    And send credential "short_credential" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "long_credential" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username" to element "username"
    And send credential "long_credential" to element "password"
    And click in "validate"
    And click in "x"
    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Allowed Characters
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "character_error_credential" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username" to element "username"
    And send credential "character_error_credential" to element "password"
    And click in "validate"
    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: Spaced Blank User Pass
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "spaced_username" to element "username"
    And send credential "password" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username" to element "username"
    And send credential "spaced_password" to element "password"
    And click in "validate"
    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: SQL Injection login
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "'admin' OR '1'='1'" to element "username"
    And send credential "'password' OR '1'='1'" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "‘ or 1=1;–." to element "username"
    And send credential "‘ or 1=1;–." to element "password"
    And click in "validate"
    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intdev.triskellsoftware.com/triskell/ |
      | https://intnr.triskellsoftware.com/triskell/  |

  Scenario Outline: SQL Injection
    Given go to web "<webside>"
#    Then check to "login" has loaded

    Examples:
      | webside                                                            |
      | https://intaws.triskellsoftware.com/triskell/'admin' OR '1'='1'    |
      | https://intdev.triskellsoftware.com/triskell/'admin' OR '1'='1'    |
      | https://intnr.triskellsoftware.com/triskell/'admin' OR '1'='1'     |
      | https://intaws.triskellsoftware.com/triskell/'password' OR '1'='1' |
      | https://intdev.triskellsoftware.com/triskell/'password' OR '1'='1' |
      | https://intnr.triskellsoftware.com/triskell/'password' OR '1'='1'  |
      | https://intaws.triskellsoftware.com/triskell/‘ or 1=1;–.           |
      | https://intdev.triskellsoftware.com/triskell/‘ or 1=1;–.           |
      | https://intnr.triskellsoftware.com/triskell/‘ or 1=1;–.            |

  Scenario Outline: XSS Injection
    Given go to web "<webside>"
#    Then check to "login" has loaded
    Examples:
      | webside |
      | https://intaws.triskellsoftware.com/triskell/<script>alert('XSS')</script> |
      | https://intdev.triskellsoftware.com/triskell/<script>alert('XSS')</script> |
      | https://intnr.triskellsoftware.com/triskell/<script>alert('XSS')</script>  |

  Scenario Outline: XSS Injection login
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "<script>alert('XSS')</script>" to element "username"
    And send credential "<script>alert('XSS')</script>" to element "password"
    And click in "validate"
    And click in "x"
    And send credential "username" to element "username"
    And send credential "spaced_password" to element "password"
    And click in "validate"
    Examples:
      | webside                                                                    |
      | https://intaws.triskellsoftware.com/triskell/                              |
      | https://intdev.triskellsoftware.com/triskell/                              |
      | https://intnr.triskellsoftware.com/triskell/                               |

  Scenario Outline: Force Attack
    Given go to web "<webside>"
    Then check to "login" has loaded
    When send credential "" to element "username"
    And send credential "" to element "password"
    And click in "validate"
    Then verify the text element "error" is "User is required"
    Examples:
      | webside                                       |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |
      | https://intaws.triskellsoftware.com/triskell/ |

  Scenario Outline: bad url
    Given go to web "<webside>"
    Then check to "bad url" has loaded
    Examples:
      | webside                                        |
      | https://intawss.triskellsoftware.com/triskell/ |
      | https://intdevs.triskellsoftware.com/triskell/ |
      | https://intnrs.triskellsoftware.com/triskell/  |
      | https://intaws.triskellsoftwaree.com/triskell/ |
      | https://intdev.triskellsoftwaree.com/triskell/ |
      | https://intnr.triskellsoftwareee.com/triskell/ |
      | https://intaws.triskellsoftware.como/triskell/ |
      | https://intdev.triskellsoftware.como/triskell/ |
      | https://intnr.triskellsoftware.como/triskell/  |

  Scenario Outline: bad url folder
    Given go to web "<webside>"
    Then check to "bad url folder" has loaded
    And click in "retry"
    Then check to "login" has loaded
       Examples:
         | webside                                       |
         | https://intaws.triskellsoftware.com/truskell/ |
         | https://intdev.triskellsoftware.com/truskell/ |
         | https://intnr.triskellsoftware.com/truskell/  |