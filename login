import React, { useState } from "react";

function ChatLogin() {
  const [step, setStep] = useState("phone");
  const [phone, setPhone] = useState("");
  const [otp, setOtp] = useState("");
  const [name, setName] = useState("");

  const sendOTP = () => {
    // OTP పంపే కోడ్
    setStep("otp");
  };

  const verifyOTP = () => {
    // OTP verify కోడ్
    setStep("name");
  };

  const saveName = () => {
    localStorage.setItem("username", name);
    alert(`Welcome ${name}`);
    
    // Chat page కి redirect
    window.location.href = "/chat";
  };

  return (
    <div className="container">
      {step === "phone" && (
        <div>
          <h2>Enter Phone Number</h2>
          <input
            type="tel"
            placeholder="+91 9876543210"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
          />
          <button onClick={sendOTP}>Send OTP</button>
        </div>
      )}

      {step === "otp" && (
        <div>
          <h2>Enter OTP</h2>
          <input
            type="text"
            placeholder="Enter OTP"
            value={otp}
            onChange={(e) => setOtp(e.target.value)}
          />
          <button onClick={verifyOTP}>Verify OTP</button>
        </div>
      )}

      {step === "name" && (
        <div>
          <h2>Enter Your Name</h2>
          <input
            type="text"
            placeholder="Your Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
          <button onClick={saveName}>Continue</button>
        </div>
      )}
    </div>
  );
}

export default ChatLogin;
