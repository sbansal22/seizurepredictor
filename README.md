# Seizure Predictor
### SEIZURE PREDICTION USING EEG
Our project analyzes EEG signals and classifies if there is a seizure present or not. In doing this, we hope to help people with epilepsy by aiding in the process of localizing a seizure origin.

### CONTEXT AND ETHICS
According to CDC in 2015, about 3 million adults and 0.5 million children had active epilepsy. Intensive research is being carried out in Self-Management, Epidemiology, and Genomics of Epilepsy. General first-aid for a seizure includes timing the seizure, moving harmful objects away, put something soft under the patient’s head, and to stay with the patient for the complete duration of the seizure.

Talking with some patients and researchers at the Mayo Clinic, we thought of making a system that could use the EEG data and process it to predict seizures by using historical EEG data. We wanted to train our algorithm to learn how to classify a piece of EEG data as seizure or non-seizure. This would be valuable as a part of a larger system that is capable of doing real-time processing and warning the doctors in the Epilepsy Monitoring Units at hospitals to make the process easier and more efficient.

In the Epilepsy Monitoring Unit, nurses and doctors will take patients off their medication to induce a seizure. Patients’ real-time EEG readings are monitored by nurses and doctors who will inject a tracer into the patients with the onset of a seizure. They then will take a CT scan of the brain to find where blood is concentrated. During a seizure, there is more blood flow to the region of the seizure. By cross-referencing the CT scan with the EEG readings, doctors can localize the origin of the seizure.

However, a seizure will diffuse throughout the brain, and therefore, doctors must inject the tracer and take the CT scan quickly in order to have a more focused origin. We propose this system as a method to auto inject the tracer and trigger the CT scan in order to more quickly analyze the brain. This allows for a more concentrated and localized image of the origin of the seizure. By doing this, surgeons are able to operate on the problematic regions of the brain to hopefully alleviate a patient’s epilepsy.

### PROPOSED IMPLEMENTATION
This technology would be implemented in the Epilepsy Monitoring Unit. We are proposing an autoinjection of the tracer and taking of the CT scan. When our technology detects a seizure within the EEG reading, the tracer would be autoadministered either through an IV or through a system similar to those used by diabetics. By automating the process, we hope to elimiate the time that can be critical to localizing the seizure without the need for nurses and doctors during the onset of a seizure.
