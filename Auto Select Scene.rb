#===========================================================================
#                          Auto Select Scene 1.2
# Autor Selitto
# Data: 20/09/2021
# Comunidade: www.centrorpg.com
# O script faz com que quando existe somente 1 membro/actor na party,
# os menus de equipamento, status e habilidades abram sem precisar
# escolher o actor, já que só tem somente 1 na party dããã
#===========================================================================
#                             COMO FUNCIONA?
# Por padrão já vem configurado para funcionar o auto select
# das 3 scenes, para remover alguma scene, basta apagar da variável Menus
# Exemplo sem o menu de equipamentos Menus = ['Status', 'Skill']
module MENUS_SCENE
    Menus = ['Equip', 'Status', 'Skill'] # CONFIGURE AQUI
  end
  #===========================================================================
  class Scene_Menu < Scene_MenuBase
  # Cria os métodos de acordo com os menus escolhidos.
  #==========================================================================
  alias skip_select create_command_window
  def create_command_window
    skip_select
      if MENUS_SCENE::Menus.include?('Equip')
        @command_window.set_handler(:equip, method(:call_equip_scene))
    end
     if MENUS_SCENE::Menus.include?('Status')
        @command_window.set_handler(:status, method(:call_status_scene))
    end
     if MENUS_SCENE::Menus.include?('Skill')
        @command_window.set_handler(:skill, method(:call_skill_scene))
      end
  end
  #===========================================================================
  # Chama a Scene de Equip
  #===========================================================================
    def call_equip_scene
      if $game_party.members.size == 1
        $game_party.menu_actor = $game_party.members[0]
        SceneManager.call(Scene_Equip)
      else
        command_personal
      end
   end
  #===========================================================================
  # Chama a Scene de Status
  #===========================================================================
    def call_status_scene
      if $game_party.members.size == 1
        $game_party.menu_actor = $game_party.members[0]
        SceneManager.call(Scene_Status)
      else
        command_personal
      end
    end
  #===========================================================================
  # Chama a Scene de Skill
  #===========================================================================
    def call_skill_scene
      if $game_party.members.size == 1
        $game_party.menu_actor = $game_party.members[0]
        SceneManager.call(Scene_Skill)
      else
        command_personal
      end
    end
  end