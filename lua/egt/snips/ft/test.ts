/* eslint-disable */

describe("my suite", () => {
  let myVar;
  beforeEach(() => {
    myVar = {
      myStuff: "stuff",
    };
  });
  it("mytest", async () => {
    expect(myVar.mySuff).to.equal("stuff");
  });
});
