#include "../../include/Game.h"

#include "../../include/GameObject.h"


namespace CoolGame {
    void Game::addGameObject(const std::string& name) {
        mGameObjects.push_back(GameObject(name));
    }
}
