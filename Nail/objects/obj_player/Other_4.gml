
Inventory.addItem(new Penny(), Side.PLAYER);

//ctrl_StateMachine.gotoState(new GameIntroState());
ctrl_StateMachine.gotoState(new StandardState6()); // DEBUG CODE

// DEBUG CODE
Inventory.addItem(new TreasureChest(), Side.PLAYER);
