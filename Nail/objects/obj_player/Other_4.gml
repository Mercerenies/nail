
Inventory.addItem(new Penny(), Side.PLAYER);

//ctrl_StateMachine.gotoState(new GameIntroState());
ctrl_StateMachine.gotoState(new InvestorState(new StandardState5()));
