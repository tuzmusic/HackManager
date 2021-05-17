import { VMTranslator } from "./VMTranslator";

const filename = process.argv[2];
VMTranslator.processPath(filename);
