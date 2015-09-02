Feature: Change Language

Background: Clear Session
	Given I am on the Home page
  	And I dismiss the build label

@language
Scenario: Changing language from the Home Page
	Given I open the navigation menu
	Then I can see the Change Language cta

@language
Scenario: allows changing language from any landing url
	Given I am on a PLP
  	And I dismiss the build label
	When I open the navigation menu
	Then I can see the Change Language cta

@language 
Scenario: does not allow changing language after navigation
	Given I open the navigation menu
	When I navigate to another page via the nav menu
	And I open the navigation menu
	Then I cannot see the Change Language cta

@language
Scenario: allows a choice of 11 different languages
	Given I open the navigation menu
	When I tap the Change Language cta
	Then the Change Language slate opens
	And 11 different languages are displayed

@language
Scenario: highlights the currently rendered language 
	Given I open the navigation menu
	When I tap the Change Language cta
	Then the Change Language slate opens
	And English has a tick by it

@language
Scenario Outline: refreshes Done button in new language 
	Given I open the navigation menu
	And I tap the Change Language cta
	And the Change Language slate opens
	When I select <language> from the language list
	Then the Done button reads <done>
	
Examples:
|language	|done 		|
|Deutsch	|Fertig		|
|English	|Done		|
|Español	|Aceptar	|
|Français	|Terminer	|
|Italiano	|Fine		|
|日本語		|完了		|
|한국어		|확인			|
|Português	|Concluído	|
|Русский	|Готово		|
|简体中文		|完成		|
|繁體中文		|完成		|

@language
Scenario Outline: reloads current page in new language
	Given I am on a PLP
  	And I dismiss the build label
	And I open the navigation menu
	When I change language to <language>
	Then the Language slate closes
	And the same PLP page is reloaded in <language_code>

Examples:
|language	|language_code	|
|Deutsch	|de				|
|Español	|es				|
|Français	|fr				|
|Italiano	|it				|
|日本語		|ja				|
|한국어		|ko				|
|Português	|pt				|
|Русский	|ru				|
|简体中文		|zh				|
|繁體中文		|zf				|

@language
Scenario Outline: reloads site in new language
	Given I open the navigation menu
	When I change language to <language>
	And I open the navigation menu
	Then the Women link in the Nav Menu reads <women>
	
Examples:
|language	|women		|
|Deutsch	|Damen		|
|Español	|Mujer		|
|Français	|Femme		|
|Italiano	|Donna		|
|日本語		|ウィメンズ	|
|한국어		|여성			|
|Português	|Feminino	|
|Русский	|Женщины	|
|简体中文		|女士		|
|繁體中文		|女款		|

@language
Scenario Outline: Change language on PDP
	Given I am on a Product Details Page
  	And I dismiss the build label
	And I open the navigation menu
	When I change language to <language>
	Then the same PDP page is reloaded in <language_code>
	
Examples:
|language	|language_code	|
|Deutsch	|de				|
|Español	|es				|
|Français	|fr				|
|Italiano	|it				|
|日本語		|ja				|
|한국어		|ko				|
|Português	|pt				|
|Русский	|ru				|
|简体中文		|zh				|
|繁體中文		|zf				|